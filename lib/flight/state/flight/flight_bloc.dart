//
//  Contrail
//  flight_bloc.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/models/data/application_error.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../../traffic/models/repos/abs/traffic_repository.dart';
import '../../models/data/flight_route.dart';
import '../../models/data/flight_snapshot.dart';
import '../../models/data/flight_track.dart';
import '../../models/repos/abs/flight_repository.dart';

part 'flight_bloc.freezed.dart';
part 'flight_event.dart';
part 'flight_state.dart';

/// The flight the person has selected: its route, flown track and live
/// position, refreshed while it stays selected.
@injectable
class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc(this._flights, this._traffic) : super(const FlightState()) {
    on<FlightSelectedEvent>(_onSelected, transformer: restartable());
    on<FlightRefreshRequestedEvent>(_onRefresh, transformer: droppable());
    on<FlightFollowToggledEvent>(
      (FlightFollowToggledEvent event, Emitter<FlightState> emit) =>
          emit(state.copyWith(following: event.following)),
    );
    on<FlightClearedEvent>(_onCleared);
  }

  static const Duration refreshInterval = Duration(seconds: 6);

  final FlightRepository _flights;
  final TrafficRepository _traffic;
  StreamSubscription<void>? _ticker;

  Future<void> _onSelected(
    FlightSelectedEvent event,
    Emitter<FlightState> emit,
  ) async {
    final Aircraft a = event.aircraft;
    emit(
      FlightState(
        snapshot: FlightSnapshot(aircraft: a),
        loadingDetails: true,
        following: event.follow,
      ),
    );
    await _ticker?.cancel();
    _ticker = Stream<void>.periodic(refreshInterval).listen(
      (_) => add(const FlightEvent.refreshRequested()),
    );

    final String? callsign = a.callsign;
    final (
      Either<ApplicationError, FlightRoute?> route,
      Either<ApplicationError, FlightTrack?> track,
    ) = await (
      callsign == null
          ? Future<Either<ApplicationError, FlightRoute?>>.value(
              const Right(null),
            )
          : _flights.route(callsign, a.position),
      _flights.track(a.hex),
    ).wait;
    if (emit.isDone) return;
    final FlightSnapshot? current = state.snapshot;
    if (current == null || current.aircraft.hex != a.hex) return;
    emit(
      state.copyWith(
        snapshot: current.copyWith(
          route: route.fold((_) => null, (FlightRoute? r) => r),
          track: track.fold((_) => null, (FlightTrack? t) => t),
        ),
        loadingDetails: false,
        detailsError:
            route.fold((ApplicationError e) => e, (_) => null) ??
            track.fold((ApplicationError e) => e, (_) => null),
      ),
    );
  }

  Future<void> _onRefresh(
    FlightRefreshRequestedEvent event,
    Emitter<FlightState> emit,
  ) async {
    final FlightSnapshot? snap = state.snapshot;
    if (snap == null) return;
    final Either<ApplicationError, Aircraft?> result = await _traffic.byHex(
      snap.aircraft.hex,
    );
    if (emit.isDone) return;
    final FlightSnapshot? current = state.snapshot;
    if (current == null || current.aircraft.hex != snap.aircraft.hex) return;
    result.fold(
      // A missed refresh keeps the last known position on screen.
      (_) {},
      (Aircraft? fresh) {
        if (fresh != null) {
          emit(state.copyWith(snapshot: current.copyWith(aircraft: fresh)));
        }
      },
    );
  }

  Future<void> _onCleared(
    FlightClearedEvent event,
    Emitter<FlightState> emit,
  ) async {
    await _ticker?.cancel();
    _ticker = null;
    emit(const FlightState());
  }

  @override
  Future<void> close() async {
    await _ticker?.cancel();
    return super.close();
  }
}
