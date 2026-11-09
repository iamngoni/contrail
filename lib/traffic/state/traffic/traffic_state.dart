//
//  Contrail
//  traffic_state.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'traffic_bloc.dart';

@freezed
abstract class TrafficState with _$TrafficState {
  const factory TrafficState({
    @Default(<Aircraft>[]) List<Aircraft> aircraft,
    @Default(TrafficStatus.initial) TrafficStatus status,
    @Default(TrafficState.defaultCenter) LatLng center,
    @Default(60) double radiusNm,
    DateTime? updatedAt,
    ApplicationError? error,
  }) = _TrafficState;

  const TrafficState._();

  /// London Heathrow, until the person's location is known.
  static const LatLng defaultCenter = LatLng(51.47, -0.45);

  int get airborneCount => aircraft.where((Aircraft a) => !a.onGround).length;
}
