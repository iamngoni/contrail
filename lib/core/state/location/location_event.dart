//
//  Contrail
//  location_event.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'location_bloc.dart';

@freezed
sealed class LocationEvent with _$LocationEvent {
  /// [userInitiated] is false for the quiet lookup at launch.
  const factory LocationEvent.requested({
    @Default(true) bool userInitiated,
  }) = LocationRequestedEvent;
}
