//
//  Contrail
//  fixtures.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:contrail/flight/models/data/airport.dart';
import 'package:contrail/flight/models/data/flight_route.dart';
import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:latlong2/latlong.dart';

const LatLng jfk = LatLng(40.6398, -73.7789);
const LatLng lhr = LatLng(51.47, -0.4543);

Aircraft aircraft({
  String hex = '407995',
  String? callsign = 'BAW116',
  LatLng position = const LatLng(51.477, -0.588),
  int altitudeFt = 1275,
  bool onGround = false,
  int verticalRateFpm = -768,
  double groundSpeedKt = 141,
}) => Aircraft(
  hex: hex,
  callsign: callsign,
  position: position,
  altitudeFt: altitudeFt,
  onGround: onGround,
  verticalRateFpm: verticalRateFpm,
  groundSpeedKt: groundSpeedKt,
  trackDeg: 90,
  registration: 'G-STBP',
  type: 'B77W',
);

const FlightRoute jfkToLhr = FlightRoute(
  airports: [
    Airport(
      iata: 'JFK',
      icao: 'KJFK',
      name: 'John F Kennedy International Airport',
      city: 'New York',
      position: jfk,
    ),
    Airport(
      iata: 'LHR',
      icao: 'EGLL',
      name: 'London Heathrow Airport',
      city: 'London',
      position: lhr,
    ),
  ],
  airlineCode: 'BAW',
);
