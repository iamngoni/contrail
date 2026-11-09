//
//  Contrail
//  traffic_bloc_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc_test/bloc_test.dart';
import 'package:contrail/core/models/data/application_error.dart';
import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:contrail/traffic/models/data/traffic_status.dart';
import 'package:contrail/traffic/state/traffic/traffic_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  late MockTrafficRepository repo;
  final Aircraft plane = aircraft();
  const ApplicationError offline = ApplicationError(
    code: ApplicationErrorCode.connection,
  );

  setUpAll(registerFallbacks);
  setUp(() => repo = MockTrafficRepository());

  blocTest<TrafficBloc, TrafficState>(
    'started loads the default viewport',
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => Right([plane])),
    build: () => TrafficBloc(repo),
    act: (TrafficBloc b) => b.add(const TrafficEvent.started()),
    expect: () => [
      isA<TrafficState>().having(
        (TrafficState s) => s.status,
        'status',
        TrafficStatus.loading,
      ),
      isA<TrafficState>()
          .having((TrafficState s) => s.aircraft, 'aircraft', [plane])
          .having((TrafficState s) => s.status, 'status', TrafficStatus.loaded)
          .having((TrafficState s) => s.airborneCount, 'airborne', 1),
    ],
    verify: (_) => verify(
      () => repo.around(TrafficState.defaultCenter, 60),
    ).called(1),
  );

  blocTest<TrafficBloc, TrafficState>(
    'an immediate viewport change queries the new area',
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => const Right([])),
    build: () => TrafficBloc(repo),
    act: (TrafficBloc b) => b.add(
      const TrafficEvent.viewportChanged(
        center: LatLng(-26.1, 28.2),
        radiusNm: 40,
        immediate: true,
      ),
    ),
    skip: 2,
    expect: () => [
      isA<TrafficState>().having(
        (TrafficState s) => s.status,
        'status',
        TrafficStatus.loaded,
      ),
    ],
    verify: (_) =>
        verify(() => repo.around(const LatLng(-26.1, 28.2), 40)).called(1),
  );

  blocTest<TrafficBloc, TrafficState>(
    'rapid viewport changes only fetch the last one',
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => const Right([])),
    build: () => TrafficBloc(repo),
    act: (TrafficBloc b) async {
      b
        ..add(
          const TrafficEvent.viewportChanged(
            center: LatLng(1, 1),
            radiusNm: 10,
          ),
        )
        ..add(
          const TrafficEvent.viewportChanged(
            center: LatLng(2, 2),
            radiusNm: 10,
          ),
        );
      await Future<void>.delayed(
        TrafficBloc.viewportSettle + const Duration(milliseconds: 100),
      );
    },
    verify: (_) {
      verifyNever(() => repo.around(const LatLng(1, 1), any()));
      verify(() => repo.around(const LatLng(2, 2), 10)).called(1);
    },
  );

  blocTest<TrafficBloc, TrafficState>(
    'a failed refresh keeps the last aircraft and flags the error',
    seed: () => TrafficState(aircraft: [plane], status: TrafficStatus.loaded),
    setUp: () => when(
      () => repo.around(any(), any()),
    ).thenAnswer((_) async => const Left(offline)),
    build: () => TrafficBloc(repo),
    act: (TrafficBloc b) => b.add(const TrafficEvent.refreshRequested()),
    expect: () => [
      isA<TrafficState>()
          .having((TrafficState s) => s.aircraft, 'aircraft', [plane])
          .having((TrafficState s) => s.status, 'status', TrafficStatus.failure)
          .having((TrafficState s) => s.error, 'error', offline),
    ],
  );
}
