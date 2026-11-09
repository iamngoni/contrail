//
//  Contrail
//  dio_traffic_repository.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/models/data/application_error.dart';
import '../../../../core/utils/dio_error_mapper.dart';
import '../../data/aircraft.dart';
import '../../dto/aircraft_list_dto.dart';
import '../abs/traffic_repository.dart';

@LazySingleton(as: TrafficRepository)
class DioTrafficRepository implements TrafficRepository {
  DioTrafficRepository(@Named('adsbApi') this._dio);

  final Dio _dio;

  @override
  Future<Either<ApplicationError, List<Aircraft>>> around(
    LatLng center,
    double radiusNm,
  ) {
    final int r = radiusNm.clamp(1, 250).round();
    final String lat = center.latitude.toStringAsFixed(4);
    final String lon = center.longitude.toStringAsFixed(4);
    return _list('/v2/point/$lat/$lon/$r');
  }

  @override
  Future<Either<ApplicationError, Aircraft?>> byHex(String hex) async =>
      (await _list('/v2/hex/${hex.toLowerCase()}')).map(
        (List<Aircraft> list) => list.isEmpty ? null : list.first,
      );

  @override
  Future<Either<ApplicationError, List<Aircraft>>> byCallsign(
    String callsign,
  ) => _list('/v2/callsign/${Uri.encodeComponent(callsign)}');

  @override
  Future<Either<ApplicationError, List<Aircraft>>> byRegistration(
    String reg,
  ) => _list('/v2/reg/${Uri.encodeComponent(reg)}');

  @override
  Future<Either<ApplicationError, List<Aircraft>>> byType(String type) =>
      _list('/v2/type/${Uri.encodeComponent(type)}');

  Future<Either<ApplicationError, List<Aircraft>>> _list(String path) async {
    try {
      final Response<Map<String, dynamic>> res = await _dio
          .get<Map<String, dynamic>>(path);
      final Map<String, dynamic>? body = res.data;
      if (body == null) {
        return const Left(ApplicationError(code: ApplicationErrorCode.server));
      }
      return Right(AircraftListDTO.fromJson(body).toDomain());
    } on DioException catch (e) {
      return Left(mapDioError(e));
    } on Object catch (e, st) {
      log('Unreadable traffic response', error: e, stackTrace: st);
      return Left(
        ApplicationError(
          code: ApplicationErrorCode.server,
          detail: e.toString(),
        ),
      );
    }
  }
}
