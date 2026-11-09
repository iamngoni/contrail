//
//  Contrail
//  flight_event.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'flight_bloc.dart';

@freezed
sealed class FlightEvent with _$FlightEvent {
  const factory FlightEvent.selected({
    required Aircraft aircraft,
    @Default(false) bool follow,
  }) = FlightSelectedEvent;

  const factory FlightEvent.refreshRequested() = FlightRefreshRequestedEvent;

  const factory FlightEvent.followToggled({required bool following}) =
      FlightFollowToggledEvent;

  const factory FlightEvent.cleared() = FlightClearedEvent;
}
