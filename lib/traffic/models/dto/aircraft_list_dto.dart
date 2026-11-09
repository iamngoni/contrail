//
//  Contrail
//  aircraft_list_dto.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/aircraft.dart';
import 'aircraft_dto.dart';

part 'aircraft_list_dto.freezed.dart';
part 'aircraft_list_dto.g.dart';

/// The `{"ac": [...]}` envelope of every adsb.lol v2 response.
@freezed
abstract class AircraftListDTO with _$AircraftListDTO {
  const factory AircraftListDTO({
    @Default(<AircraftDTO>[]) List<AircraftDTO> ac,
  }) = _AircraftListDTO;

  const AircraftListDTO._();

  factory AircraftListDTO.fromJson(Map<String, dynamic> json) =>
      _$AircraftListDTOFromJson(json);

  List<Aircraft> toDomain() =>
      ac.map((AircraftDTO a) => a.toDomain()).nonNulls.toList();
}
