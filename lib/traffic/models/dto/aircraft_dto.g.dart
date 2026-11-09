// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AircraftDTO _$AircraftDTOFromJson(Map<String, dynamic> json) => _AircraftDTO(
  hex: json['hex'] as String,
  flight: json['flight'] as String?,
  registration: json['r'] as String?,
  type: json['t'] as String?,
  description: json['desc'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lon: (json['lon'] as num?)?.toDouble(),
  altBaro: json['alt_baro'],
  altGeom: json['alt_geom'] as num?,
  gs: json['gs'] as num?,
  track: json['track'] as num?,
  trueHeading: json['true_heading'] as num?,
  baroRate: json['baro_rate'] as num?,
  geomRate: json['geom_rate'] as num?,
  squawk: json['squawk'] as String?,
  emergency: json['emergency'] as String?,
);

Map<String, dynamic> _$AircraftDTOToJson(_AircraftDTO instance) =>
    <String, dynamic>{
      'hex': instance.hex,
      'flight': ?instance.flight,
      'r': ?instance.registration,
      't': ?instance.type,
      'desc': ?instance.description,
      'lat': ?instance.lat,
      'lon': ?instance.lon,
      'alt_baro': ?instance.altBaro,
      'alt_geom': ?instance.altGeom,
      'gs': ?instance.gs,
      'track': ?instance.track,
      'true_heading': ?instance.trueHeading,
      'baro_rate': ?instance.baroRate,
      'geom_rate': ?instance.geomRate,
      'squawk': ?instance.squawk,
      'emergency': ?instance.emergency,
    };
