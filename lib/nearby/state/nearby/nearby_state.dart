//
//  Contrail
//  nearby_state.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'nearby_bloc.dart';

@freezed
abstract class NearbyState with _$NearbyState {
  const factory NearbyState({
    LatLng? me,
    @Default(50) int radiusKm,
    @Default(NearbyStatus.loading) NearbyStatus status,
    @Default(<NearbyAircraft>[]) List<NearbyAircraft> rows,
    ApplicationError? error,
  }) = _NearbyState;
}
