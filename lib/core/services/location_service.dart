//
//  Contrail
//  location_service.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../models/data/application_error.dart';

/// The phone's position, asking for permission when needed.
@lazySingleton
class LocationService {
  Future<Either<ApplicationError, LatLng>> current() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return const Left(
          ApplicationError(code: ApplicationErrorCode.locationDisabled),
        );
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const Left(
          ApplicationError(code: ApplicationErrorCode.locationDenied),
        );
      }
      final Position p = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 10),
        ),
      );
      return Right(LatLng(p.latitude, p.longitude));
    } on Object catch (e) {
      return Left(
        ApplicationError(
          code: ApplicationErrorCode.unknown,
          detail: e.toString(),
        ),
      );
    }
  }
}
