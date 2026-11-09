//
//  Contrail
//  nearby_bloc.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/models/data/application_error.dart';
import '../../../core/utils/geo.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../../traffic/models/repos/abs/traffic_repository.dart';
import '../../models/data/nearby_aircraft.dart';
import '../../models/data/nearby_status.dart';

part 'nearby_bloc.freezed.dart';
part 'nearby_event.dart';
part 'nearby_state.dart';

/// Airborne aircraft around the person, closest first.
@injectable
class NearbyBloc extends Bloc<NearbyEvent, NearbyState> {
  NearbyBloc(this._traffic) : super(const NearbyState()) {
    on<NearbyStartedEvent>(_onStarted, transformer: restartable());
    on<NearbyRadiusChangedEvent>(_onRadius, transformer: restartable());
    on<NearbyRefreshRequestedEvent>(_onRefresh, transformer: droppable());
  }

  static const List<int> radiiKm = [25, 50, 100];

  final TrafficRepository _traffic;

  Future<void> _onStarted(
    NearbyStartedEvent event,
    Emitter<NearbyState> emit,
  ) async {
    emit(state.copyWith(me: event.me));
    await _load(emit);
  }

  Future<void> _onRadius(
    NearbyRadiusChangedEvent event,
    Emitter<NearbyState> emit,
  ) async {
    emit(state.copyWith(radiusKm: event.radiusKm));
    await _load(emit);
  }

  Future<void> _onRefresh(
    NearbyRefreshRequestedEvent event,
    Emitter<NearbyState> emit,
  ) => _load(emit);

  Future<void> _load(Emitter<NearbyState> emit) async {
    final LatLng? me = state.me;
    if (me == null) return;
    emit(state.copyWith(status: NearbyStatus.loading));
    final Either<ApplicationError, List<Aircraft>> result = await _traffic
        .around(me, state.radiusKm / kmPerNauticalMile);
    if (emit.isDone) return;
    result.fold(
      (ApplicationError error) =>
          emit(state.copyWith(status: NearbyStatus.failure, error: error)),
      (List<Aircraft> list) => emit(
        state.copyWith(
          status: NearbyStatus.loaded,
          rows: rank(me, list, state.radiusKm),
          error: null,
        ),
      ),
    );
  }

  /// Airborne aircraft within [radiusKm] of [me], nearest first.
  static List<NearbyAircraft> rank(
    LatLng me,
    List<Aircraft> list,
    int radiusKm,
  ) {
    final List<NearbyAircraft> rows = [
      for (final Aircraft a in list)
        if (!a.onGround)
          NearbyAircraft(
            aircraft: a,
            distanceKm: distanceKm(me, a.position),
            bearingDeg: bearingDeg(me, a.position),
          ),
    ]..removeWhere((NearbyAircraft r) => r.distanceKm > radiusKm);
    return rows..sort(
      (NearbyAircraft x, NearbyAircraft y) =>
          x.distanceKm.compareTo(y.distanceKm),
    );
  }
}
