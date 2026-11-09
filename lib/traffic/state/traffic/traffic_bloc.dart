//
//  Contrail
//  traffic_bloc.dart
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
import 'package:latlong2/latlong.dart';

import '../../../core/models/data/application_error.dart';
import '../../models/data/aircraft.dart';
import '../../models/data/traffic_status.dart';
import '../../models/repos/abs/traffic_repository.dart';

part 'traffic_bloc.freezed.dart';
part 'traffic_event.dart';
part 'traffic_state.dart';

/// Live traffic in the map's viewport, refreshed every few seconds.
@injectable
class TrafficBloc extends Bloc<TrafficEvent, TrafficState> {
  TrafficBloc(this._repository) : super(const TrafficState()) {
    on<TrafficStartedEvent>(_onStarted, transformer: droppable());
    on<TrafficViewportChangedEvent>(
      _onViewportChanged,
      transformer: restartable(),
    );
    on<TrafficRefreshRequestedEvent>(_onRefresh, transformer: droppable());
  }

  static const Duration refreshInterval = Duration(seconds: 6);
  static const Duration viewportSettle = Duration(milliseconds: 700);

  final TrafficRepository _repository;
  StreamSubscription<void>? _ticker;

  Future<void> _onStarted(
    TrafficStartedEvent event,
    Emitter<TrafficState> emit,
  ) async {
    await _ticker?.cancel();
    _ticker = Stream<void>.periodic(refreshInterval).listen(
      (_) => add(const TrafficEvent.refreshRequested()),
    );
    await _fetch(emit);
  }

  Future<void> _onViewportChanged(
    TrafficViewportChangedEvent event,
    Emitter<TrafficState> emit,
  ) async {
    emit(state.copyWith(center: event.center, radiusNm: event.radiusNm));
    if (!event.immediate) await Future<void>.delayed(viewportSettle);
    if (emit.isDone) return;
    await _fetch(emit);
  }

  Future<void> _onRefresh(
    TrafficRefreshRequestedEvent event,
    Emitter<TrafficState> emit,
  ) => _fetch(emit);

  Future<void> _fetch(Emitter<TrafficState> emit) async {
    if (state.aircraft.isEmpty) {
      emit(state.copyWith(status: TrafficStatus.loading));
    }
    final Either<ApplicationError, List<Aircraft>> result = await _repository
        .around(state.center, state.radiusNm);
    if (emit.isDone) return;
    result.fold(
      // Keep showing the last good picture; just flag the failure.
      (ApplicationError error) =>
          emit(state.copyWith(status: TrafficStatus.failure, error: error)),
      (List<Aircraft> aircraft) => emit(
        state.copyWith(
          aircraft: aircraft,
          status: TrafficStatus.loaded,
          updatedAt: DateTime.now(),
          error: null,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _ticker?.cancel();
    return super.close();
  }
}
