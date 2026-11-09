//
//  Contrail
//  traffic_event.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'traffic_bloc.dart';

@freezed
sealed class TrafficEvent with _$TrafficEvent {
  const factory TrafficEvent.started() = TrafficStartedEvent;

  /// [radiusNm] covers the visible map. [immediate] skips the settle delay.
  const factory TrafficEvent.viewportChanged({
    required LatLng center,
    required double radiusNm,
    @Default(false) bool immediate,
  }) = TrafficViewportChangedEvent;

  const factory TrafficEvent.refreshRequested() = TrafficRefreshRequestedEvent;
}
