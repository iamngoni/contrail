//
//  Contrail
//  location_state.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'location_bloc.dart';

@freezed
sealed class LocationState with _$LocationState {
  const LocationState._();

  const factory LocationState.initial() = LocationInitialState;
  const factory LocationState.locating({LatLng? previous}) =
      LocationLocatingState;
  const factory LocationState.located({
    required LatLng position,
    required bool userInitiated,
  }) = LocationLocatedState;
  const factory LocationState.unavailable({
    required ApplicationError error,
    required bool userInitiated,
  }) = LocationUnavailableState;

  /// The last known position, if any.
  LatLng? get position => switch (this) {
    LocationLocatedState(:final LatLng position) => position,
    LocationLocatingState(:final LatLng? previous) => previous,
    _ => null,
  };
}
