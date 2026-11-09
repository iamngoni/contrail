//
//  Contrail
//  aircraft_dto.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../data/aircraft.dart';

part 'aircraft_dto.freezed.dart';
part 'aircraft_dto.g.dart';

/// An aircraft record in readsb's JSON format, as served by adsb.lol.
@freezed
abstract class AircraftDTO with _$AircraftDTO {
  const factory AircraftDTO({
    required String hex,
    String? flight,
    @JsonKey(name: 'r') String? registration,
    @JsonKey(name: 't') String? type,
    @JsonKey(name: 'desc') String? description,
    double? lat,
    double? lon,

    /// Feet, or the string "ground".
    @JsonKey(name: 'alt_baro') Object? altBaro,
    @JsonKey(name: 'alt_geom') num? altGeom,
    num? gs,
    num? track,
    @JsonKey(name: 'true_heading') num? trueHeading,
    @JsonKey(name: 'baro_rate') num? baroRate,
    @JsonKey(name: 'geom_rate') num? geomRate,
    String? squawk,
    String? emergency,
  }) = _AircraftDTO;

  const AircraftDTO._();

  factory AircraftDTO.fromJson(Map<String, dynamic> json) =>
      _$AircraftDTOFromJson(json);

  /// Null when the record has no position yet.
  Aircraft? toDomain() {
    final double? latitude = lat;
    final double? longitude = lon;
    if (latitude == null || longitude == null) return null;
    final bool ground = altBaro == 'ground';
    final String? cs = flight?.trim();
    final Object? baro = altBaro;
    return Aircraft(
      hex: hex.replaceAll('~', '').toLowerCase(),
      position: LatLng(latitude, longitude),
      callsign: (cs == null || cs.isEmpty || cs.contains('@')) ? null : cs,
      registration: registration?.trim(),
      type: type?.trim(),
      description: description?.trim(),
      altitudeFt: ground ? 0 : (baro is num ? baro.round() : altGeom?.round()),
      onGround: ground,
      groundSpeedKt: gs?.toDouble(),
      trackDeg: (track ?? trueHeading)?.toDouble(),
      verticalRateFpm: (baroRate ?? geomRate)?.round(),
      squawk: squawk,
      emergency: emergency,
    );
  }
}
