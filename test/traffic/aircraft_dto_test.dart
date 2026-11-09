//
//  Contrail
//  aircraft_dto_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:contrail/traffic/models/dto/aircraft_list_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Shape copied from a live adsb.lol /v2/point response.
  const Map<String, dynamic> response = {
    'ac': [
      {
        'hex': '407995',
        'type': 'adsb_icao',
        'flight': 'BAW116  ',
        'r': 'G-STBP',
        't': 'B77W',
        'alt_baro': 1275,
        'alt_geom': 1500,
        'gs': 141.0,
        'track': 89.59,
        'baro_rate': -768,
        'squawk': '4525',
        'emergency': 'none',
        'lat': 51.477,
        'lon': -0.588,
      },
      {
        'hex': '~405a48',
        'flight': '@@@@@@@@',
        'alt_baro': 'ground',
        'lat': 51.475,
        'lon': -0.489,
      },
      {'hex': 'abcdef', 'flight': 'NOPOS'},
      {
        'hex': 'c01725',
        'flight': 'ACA856',
        'alt_baro': 16675,
        'geom_rate': -1312,
        'squawk': '7700',
        'lat': 51.97,
        'lon': -1.39,
      },
    ],
  };

  late List<Aircraft> parsed;

  setUp(() => parsed = AircraftListDTO.fromJson(response).toDomain());

  test('records without a position are dropped', () {
    expect(parsed.map((Aircraft a) => a.hex), [
      '407995',
      '405a48',
      'c01725',
    ]);
  });

  test('an airborne record maps every field', () {
    final Aircraft a = parsed.first;
    expect(a.callsign, 'BAW116');
    expect(a.registration, 'G-STBP');
    expect(a.type, 'B77W');
    expect(a.altitudeFt, 1275);
    expect(a.onGround, isFalse);
    expect(a.groundSpeedKt, 141);
    expect(a.trackDeg, closeTo(89.59, 1e-9));
    expect(a.verticalRateFpm, -768);
    expect(a.isEmergency, isFalse);
  });

  test('"ground" altitude, placeholder callsigns and ~ hex are handled', () {
    final Aircraft a = parsed[1];
    expect(a.onGround, isTrue);
    expect(a.altitudeFt, 0);
    expect(a.callsign, isNull);
    expect(a.hex, '405a48');
  });

  test('squawk 7700 is a general emergency; geom rate is a fallback', () {
    final Aircraft a = parsed[2];
    expect(a.emergencyKind, EmergencyKind.general);
    expect(a.verticalRateFpm, -1312);
  });

  test('an empty response is an empty list', () {
    expect(AircraftListDTO.fromJson(const {}).toDomain(), isEmpty);
  });
}
