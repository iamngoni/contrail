//
//  Contrail
//  dio_flight_repository.dart
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
import '../../data/flight_route.dart';
import '../../data/flight_track.dart';
import '../../dto/route_dto.dart';
import '../../dto/trace_dto.dart';
import '../abs/flight_repository.dart';

@LazySingleton(as: FlightRepository)
class DioFlightRepository implements FlightRepository {
  DioFlightRepository(
    @Named('adsbRoutes') this._routes,
    @Named('adsbData') this._data,
  );

  final Dio _routes;
  final Dio _data;

  /// Routes rarely change during a session; unknown routes are cached too.
  final Map<String, FlightRoute?> _routeCache = {};

  @override
  Future<Either<ApplicationError, FlightRoute?>> route(
    String callsign,
    LatLng at,
  ) async {
    final String cs = callsign.trim().toUpperCase();
    if (cs.length < 3) return const Right(null);
    if (!_routeCache.containsKey(cs)) {
      try {
        final Response<Map<String, dynamic>> res = await _routes
            .get<Map<String, dynamic>>(
              '/routes/${cs.substring(0, 2)}/$cs.json',
            );
        final Map<String, dynamic>? body = res.data;
        _routeCache[cs] = body == null
            ? null
            : RouteDTO.fromJson(body).toDomain();
      } on DioException catch (e) {
        // The route service answers 404 (as HTML) for unknown callsigns.
        if (e.response?.statusCode == 404 ||
            e.type == DioExceptionType.unknown) {
          _routeCache[cs] = null;
        } else {
          return Left(mapDioError(e));
        }
      } on Object catch (e, st) {
        log('Unreadable route for $cs', error: e, stackTrace: st);
        _routeCache[cs] = null;
      }
    }
    final FlightRoute? r = _routeCache[cs];
    return Right(r != null && r.isPlausibleAt(at) ? r : null);
  }

  @override
  Future<Either<ApplicationError, FlightTrack?>> track(String hex) async {
    final String h = hex.toLowerCase();
    try {
      final Response<Map<String, dynamic>> res = await _data
          .get<Map<String, dynamic>>(
            '/data/traces/${h.substring(h.length - 2)}/trace_full_$h.json',
          );
      final Map<String, dynamic>? body = res.data;
      return Right(body == null ? null : TraceDTO.fromJson(body).toDomain());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const Right(null);
      return Left(mapDioError(e));
    } on Object catch (e, st) {
      log('Unreadable trace for $h', error: e, stackTrace: st);
      return Left(
        ApplicationError(
          code: ApplicationErrorCode.server,
          detail: e.toString(),
        ),
      );
    }
  }
}
