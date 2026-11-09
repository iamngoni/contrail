//
//  Contrail
//  flight_repository.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/models/data/application_error.dart';
import '../../data/flight_route.dart';
import '../../data/flight_track.dart';

/// Route and flown track for a flight.
abstract class FlightRepository {
  /// The route for [callsign], or null when it is unknown or doesn't fit
  /// an aircraft at [at].
  Future<Either<ApplicationError, FlightRoute?>> route(
    String callsign,
    LatLng at,
  );

  /// The leg [hex] is flying now, or null when no trace exists.
  Future<Either<ApplicationError, FlightTrack?>> track(String hex);
}
