//
//  Contrail
//  mocks.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:contrail/flight/models/repos/abs/flight_repository.dart';
import 'package:contrail/traffic/models/repos/abs/traffic_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

class MockTrafficRepository extends Mock implements TrafficRepository {}

class MockFlightRepository extends Mock implements FlightRepository {}

void registerFallbacks() {
  registerFallbackValue(const LatLng(0, 0));
}
