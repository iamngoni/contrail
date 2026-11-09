// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirportDTO _$AirportDTOFromJson(Map<String, dynamic> json) => _AirportDTO(
  iata: json['iata'] as String? ?? '',
  icao: json['icao'] as String? ?? '',
  name: json['name'] as String? ?? '',
  city: json['location'] as String? ?? '',
  lat: (json['lat'] as num?)?.toDouble(),
  lon: (json['lon'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AirportDTOToJson(_AirportDTO instance) =>
    <String, dynamic>{
      'iata': instance.iata,
      'icao': instance.icao,
      'name': instance.name,
      'location': instance.city,
      'lat': ?instance.lat,
      'lon': ?instance.lon,
    };
