// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteDTO _$RouteDTOFromJson(Map<String, dynamic> json) => _RouteDTO(
  airports:
      (json['_airports'] as List<dynamic>?)
          ?.map((e) => AirportDTO.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AirportDTO>[],
  airlineCode: json['airline_code'] as String?,
);

Map<String, dynamic> _$RouteDTOToJson(_RouteDTO instance) => <String, dynamic>{
  '_airports': instance.airports.map((e) => e.toJson()).toList(),
  'airline_code': ?instance.airlineCode,
};
