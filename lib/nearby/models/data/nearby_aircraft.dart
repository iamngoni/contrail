//
//  Contrail
//  nearby_aircraft.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../traffic/models/data/aircraft.dart';

part 'nearby_aircraft.freezed.dart';

/// An aircraft with its distance and direction from the person.
@freezed
abstract class NearbyAircraft with _$NearbyAircraft {
  const factory NearbyAircraft({
    required Aircraft aircraft,
    required double distanceKm,
    required double bearingDeg,
  }) = _NearbyAircraft;
}
