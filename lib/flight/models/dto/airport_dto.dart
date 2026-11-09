//
//  Contrail
//  airport_dto.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../data/airport.dart';

part 'airport_dto.freezed.dart';
part 'airport_dto.g.dart';

@freezed
abstract class AirportDTO with _$AirportDTO {
  const factory AirportDTO({
    @Default('') String iata,
    @Default('') String icao,
    @Default('') String name,
    @JsonKey(name: 'location') @Default('') String city,
    double? lat,
    double? lon,
  }) = _AirportDTO;

  const AirportDTO._();

  factory AirportDTO.fromJson(Map<String, dynamic> json) =>
      _$AirportDTOFromJson(json);

  Airport? toDomain() {
    final double? latitude = lat;
    final double? longitude = lon;
    if (latitude == null || longitude == null) return null;
    return Airport(
      iata: iata,
      icao: icao,
      name: name,
      city: city,
      position: LatLng(latitude, longitude),
    );
  }
}
