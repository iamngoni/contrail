//
//  Contrail
//  flight_state.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'flight_bloc.dart';

@freezed
abstract class FlightState with _$FlightState {
  const factory FlightState({
    /// Null when nothing is selected.
    FlightSnapshot? snapshot,
    @Default(false) bool loadingDetails,
    @Default(false) bool following,

    /// Set when the route or track couldn't be fetched.
    ApplicationError? detailsError,
  }) = _FlightState;
}
