//
//  Contrail
//  nearby_bloc_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc_test/bloc_test.dart';
import 'package:contrail/nearby/models/data/nearby_aircraft.dart';
import 'package:contrail/nearby/models/data/nearby_status.dart';
import 'package:contrail/nearby/state/nearby/nearby_bloc.dart';
import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  const LatLng me = LatLng(51.47, -0.45);
  final Aircraft near = aircraft(hex: 'a', position: const LatLng(51.5, -0.45));
  final Aircraft far = aircraft(hex: 'b', position: const LatLng(51.9, -0.45));
  final Aircraft parked = aircraft(hex: 'c', position: me, onGround: true);
  final Aircraft outside = aircraft(hex: 'd', position: const LatLng(53, 0));

  late MockTrafficRepository repo;

  setUpAll(registerFallbacks);
  setUp(() => repo = MockTrafficRepository());

  test('rank keeps airborne aircraft inside the radius, nearest first', () {
    final List<NearbyAircraft> rows = NearbyBloc.rank(me, [
      far,
      outside,
      parked,
      near,
    ], 50);
    expect(rows.map((NearbyAircraft r) => r.aircraft.hex), ['a', 'b']);
    expect(rows.first.distanceKm, closeTo(3.3, 0.2));
    expect(rows.first.bearingDeg, closeTo(0, 1));
  });

  blocTest<NearbyBloc, NearbyState>(
    'started loads aircraft around the person',
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => Right([far, near])),
    build: () => NearbyBloc(repo),
    act: (NearbyBloc b) => b.add(const NearbyEvent.started(me: me)),
    skip: 1,
    expect: () => [
      isA<NearbyState>()
          .having((NearbyState s) => s.status, 'status', NearbyStatus.loaded)
          .having(
            (NearbyState s) => s.rows.map((NearbyAircraft r) => r.aircraft),
            'rows',
            [near, far],
          ),
    ],
  );

  blocTest<NearbyBloc, NearbyState>(
    'changing the radius reloads with the new distance',
    seed: () => const NearbyState(me: me),
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => const Right([])),
    build: () => NearbyBloc(repo),
    act: (NearbyBloc b) =>
        b.add(const NearbyEvent.radiusChanged(radiusKm: 100)),
    verify: (_) => verify(() => repo.around(me, 100 / 1.852)).called(1),
  );
}
