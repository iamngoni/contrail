//
//  Contrail
//  flight_bloc_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc_test/bloc_test.dart';
import 'package:contrail/core/models/data/application_error.dart';
import 'package:contrail/flight/models/data/flight_snapshot.dart';
import 'package:contrail/flight/models/data/flight_track.dart';
import 'package:contrail/flight/state/flight/flight_bloc.dart';
import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  late MockFlightRepository flights;
  late MockTrafficRepository traffic;
  final Aircraft plane = aircraft();
  const FlightTrack track = FlightTrack(points: []);

  setUpAll(registerFallbacks);
  setUp(() {
    flights = MockFlightRepository();
    traffic = MockTrafficRepository();
  });

  blocTest<FlightBloc, FlightState>(
    'selecting loads the route and track',
    setUp: () {
      when(
        () => flights.route(any(), any()),
      ).thenAnswer((_) async => const Right(jfkToLhr));
      when(
        () => flights.track(any()),
      ).thenAnswer((_) async => const Right(track));
    },
    build: () => FlightBloc(flights, traffic),
    act: (FlightBloc b) => b.add(FlightEvent.selected(aircraft: plane)),
    expect: () => [
      isA<FlightState>()
          .having((FlightState s) => s.loadingDetails, 'loading', true)
          .having((FlightState s) => s.snapshot?.route, 'route', isNull),
      isA<FlightState>()
          .having((FlightState s) => s.loadingDetails, 'loading', false)
          .having((FlightState s) => s.snapshot?.route, 'route', jfkToLhr)
          .having((FlightState s) => s.snapshot?.track, 'track', track)
          .having((FlightState s) => s.detailsError, 'error', isNull),
    ],
    verify: (_) => verify(() => flights.route('BAW116', plane.position)),
  );

  blocTest<FlightBloc, FlightState>(
    'a failed lookup still shows the aircraft and reports the error',
    setUp: () {
      when(() => flights.route(any(), any())).thenAnswer(
        (_) async =>
            const Left(ApplicationError(code: ApplicationErrorCode.timeout)),
      );
      when(
        () => flights.track(any()),
      ).thenAnswer((_) async => const Right(null));
    },
    build: () => FlightBloc(flights, traffic),
    act: (FlightBloc b) => b.add(FlightEvent.selected(aircraft: plane)),
    skip: 1,
    expect: () => [
      isA<FlightState>()
          .having((FlightState s) => s.snapshot?.aircraft, 'aircraft', plane)
          .having(
            (FlightState s) => s.detailsError?.code,
            'error',
            ApplicationErrorCode.timeout,
          ),
    ],
  );

  blocTest<FlightBloc, FlightState>(
    'an aircraft without a callsign skips the route lookup',
    setUp: () => when(
      () => flights.track(any()),
    ).thenAnswer((_) async => const Right(null)),
    build: () => FlightBloc(flights, traffic),
    act: (FlightBloc b) =>
        b.add(FlightEvent.selected(aircraft: aircraft(callsign: null))),
    verify: (_) => verifyNever(() => flights.route(any(), any())),
  );

  blocTest<FlightBloc, FlightState>(
    'refresh moves the selected aircraft to its new position',
    seed: () => FlightState(snapshot: FlightSnapshot(aircraft: plane)),
    setUp: () => when(() => traffic.byHex(any())).thenAnswer(
      (_) async => Right(plane.copyWith(position: const LatLng(51.47, -0.5))),
    ),
    build: () => FlightBloc(flights, traffic),
    act: (FlightBloc b) => b.add(const FlightEvent.refreshRequested()),
    expect: () => [
      isA<FlightState>().having(
        (FlightState s) => s.snapshot?.aircraft.position,
        'position',
        const LatLng(51.47, -0.5),
      ),
    ],
  );

  blocTest<FlightBloc, FlightState>(
    'follow toggles and clearing resets everything',
    seed: () => FlightState(snapshot: FlightSnapshot(aircraft: plane)),
    build: () => FlightBloc(flights, traffic),
    act: (FlightBloc b) => b
      ..add(const FlightEvent.followToggled(following: true))
      ..add(const FlightEvent.cleared()),
    expect: () => [
      isA<FlightState>().having((FlightState s) => s.following, 'f', true),
      const FlightState(),
    ],
  );
}
