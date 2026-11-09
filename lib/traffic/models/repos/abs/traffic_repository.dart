//
//  Contrail
//  traffic_repository.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/models/data/application_error.dart';
import '../../data/aircraft.dart';

/// Live aircraft from the ADS-B network.
abstract class TrafficRepository {
  /// Every aircraft within [radiusNm] nautical miles (max 250) of [center].
  Future<Either<ApplicationError, List<Aircraft>>> around(
    LatLng center,
    double radiusNm,
  );

  Future<Either<ApplicationError, Aircraft?>> byHex(String hex);

  Future<Either<ApplicationError, List<Aircraft>>> byCallsign(String callsign);

  Future<Either<ApplicationError, List<Aircraft>>> byRegistration(String reg);

  Future<Either<ApplicationError, List<Aircraft>>> byType(String type);
}
