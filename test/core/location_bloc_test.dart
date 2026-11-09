//
//  Contrail
//  location_bloc_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc_test/bloc_test.dart';
import 'package:contrail/core/models/data/application_error.dart';
import 'package:contrail/core/services/location_service.dart';
import 'package:contrail/core/state/location/location_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockLocationService service;
  const LatLng here = LatLng(-17.83, 31.05);

  setUp(() => service = MockLocationService());

  blocTest<LocationBloc, LocationState>(
    'a found position is reported with who asked',
    setUp: () => when(
      () => service.current(),
    ).thenAnswer((_) async => const Right(here)),
    build: () => LocationBloc(service),
    act: (LocationBloc b) =>
        b.add(const LocationEvent.requested(userInitiated: false)),
    expect: () => [
      const LocationState.locating(),
      const LocationState.located(position: here, userInitiated: false),
    ],
  );

  blocTest<LocationBloc, LocationState>(
    'a refusal is reported and keeps no position',
    setUp: () => when(() => service.current()).thenAnswer(
      (_) async => const Left(
        ApplicationError(code: ApplicationErrorCode.locationDenied),
      ),
    ),
    build: () => LocationBloc(service),
    act: (LocationBloc b) => b.add(const LocationEvent.requested()),
    skip: 1,
    expect: () => [
      isA<LocationUnavailableState>()
          .having((LocationUnavailableState s) => s.userInitiated, 'user', true)
          .having((LocationState s) => s.position, 'position', isNull),
    ],
  );
}
