//
//  Contrail
//  route_dto.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/airport.dart';
import '../data/flight_route.dart';
import 'airport_dto.dart';

part 'route_dto.freezed.dart';
part 'route_dto.g.dart';

/// A route record from adsb.lol's crowd-sourced route database.
@freezed
abstract class RouteDTO with _$RouteDTO {
  const factory RouteDTO({
    @JsonKey(name: '_airports')
    @Default(<AirportDTO>[])
    List<AirportDTO> airports,
    @JsonKey(name: 'airline_code') String? airlineCode,
  }) = _RouteDTO;

  const RouteDTO._();

  factory RouteDTO.fromJson(Map<String, dynamic> json) =>
      _$RouteDTOFromJson(json);

  /// Null unless at least an origin and destination are known.
  FlightRoute? toDomain() {
    final List<Airport> list = airports
        .map((AirportDTO a) => a.toDomain())
        .nonNulls
        .toList();
    if (list.length < 2) return null;
    return FlightRoute(airports: list, airlineCode: airlineCode);
  }
}
