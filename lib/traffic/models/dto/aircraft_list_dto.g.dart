// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AircraftListDTO _$AircraftListDTOFromJson(Map<String, dynamic> json) =>
    _AircraftListDTO(
      ac:
          (json['ac'] as List<dynamic>?)
              ?.map((e) => AircraftDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AircraftDTO>[],
    );

Map<String, dynamic> _$AircraftListDTOToJson(_AircraftListDTO instance) =>
    <String, dynamic>{'ac': instance.ac.map((e) => e.toJson()).toList()};
