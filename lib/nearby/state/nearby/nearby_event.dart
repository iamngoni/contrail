//
//  Contrail
//  nearby_event.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'nearby_bloc.dart';

@freezed
sealed class NearbyEvent with _$NearbyEvent {
  const factory NearbyEvent.started({required LatLng me}) = NearbyStartedEvent;

  const factory NearbyEvent.radiusChanged({required int radiusKm}) =
      NearbyRadiusChangedEvent;

  const factory NearbyEvent.refreshRequested() = NearbyRefreshRequestedEvent;
}
