//
//  Contrail
//  flight_route.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/utils/geo.dart';
import 'airport.dart';

part 'flight_route.freezed.dart';

/// Origin, any intermediate stops, destination.
@freezed
abstract class FlightRoute with _$FlightRoute {
  const factory FlightRoute({
    required List<Airport> airports,
    String? airlineCode,
  }) = _FlightRoute;

  const FlightRoute._();

  Airport get origin => airports.first;
  Airport get destination => airports.last;
  List<Airport> get stops => airports.sublist(1, airports.length - 1);

  /// The route database is crowd-sourced and sometimes stale. A route is
  /// only trusted when [at] lies roughly between two consecutive airports.
  bool isPlausibleAt(LatLng at) {
    for (var i = 0; i < airports.length - 1; i++) {
      final LatLng a = airports[i].position;
      final LatLng b = airports[i + 1].position;
      final double direct = distanceKm(a, b);
      final double via = distanceKm(a, at) + distanceKm(at, b);
      if (via <= direct * 1.3 + 250) return true;
    }
    return false;
  }
}
