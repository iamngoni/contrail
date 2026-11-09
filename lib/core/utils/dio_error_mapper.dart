//
//  Contrail
//  dio_error_mapper.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:dio/dio.dart';

import '../models/data/application_error.dart';

/// Turns a Dio failure into something the UI can explain.
ApplicationError mapDioError(Object error) {
  if (error is! DioException) {
    return ApplicationError(
      code: ApplicationErrorCode.unknown,
      detail: error.toString(),
    );
  }
  final ApplicationErrorCode code = switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => ApplicationErrorCode.timeout,
    DioExceptionType.connectionError => ApplicationErrorCode.connection,
    DioExceptionType.badResponse ||
    DioExceptionType.badCertificate => ApplicationErrorCode.server,
    DioExceptionType.cancel ||
    DioExceptionType.unknown => ApplicationErrorCode.unknown,
  };
  return ApplicationError(code: code, detail: error.message);
}
