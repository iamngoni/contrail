//
//  Contrail
//  airlines_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:contrail/core/utils/airlines.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BA 116 searches BAW116 too', () {
    expect(callsignCandidates('ba 116'), containsAll(['BA116', 'BAW116']));
  });

  test('flight numbers display in IATA form when known', () {
    expect(flightNumber('BAW116'), 'BA116');
    expect(flightNumber('N123AB'), 'N123AB');
    expect(flightNumber('EZY61PG'), 'U261PG');
  });

  test('airline names come from the ICAO prefix', () {
    expect(airlineName('VIR450'), 'Virgin Atlantic');
    expect(airlineName('XYZ1'), isNull);
    expect(airlineName(null), isNull);
  });
}
