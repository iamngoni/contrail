//
//  Contrail
//  airport.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'airport.freezed.dart';

@freezed
abstract class Airport with _$Airport {
  const factory Airport({
    required String iata,
    required String icao,
    required String name,
    required String city,
    required LatLng position,
  }) = _Airport;

  const Airport._();

  /// IATA when there is one, otherwise ICAO.
  String get code => iata.isNotEmpty ? iata : icao;
}
