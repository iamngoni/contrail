//
//  Contrail
//  aircraft.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'aircraft.freezed.dart';

/// One aircraft as last reported by the ADS-B network.
@freezed
abstract class Aircraft with _$Aircraft {
  const factory Aircraft({
    required String hex,
    required LatLng position,
    String? callsign,
    String? registration,
    String? type,
    String? description,
    int? altitudeFt,
    @Default(false) bool onGround,
    double? groundSpeedKt,
    double? trackDeg,
    int? verticalRateFpm,
    String? squawk,
    String? emergency,
  }) = _Aircraft;

  const Aircraft._();

  EmergencyKind? get emergencyKind => switch (squawk) {
    '7700' => EmergencyKind.general,
    '7600' => EmergencyKind.radio,
    '7500' => EmergencyKind.hijack,
    _ when emergency != null && emergency != 'none' => EmergencyKind.other,
    _ => null,
  };

  bool get isEmergency => emergencyKind != null;
}

enum EmergencyKind { general, radio, hijack, other }
