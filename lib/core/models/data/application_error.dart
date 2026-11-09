//
//  Contrail
//  application_error.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_error.freezed.dart';

/// Why a repository operation failed, as something the UI can explain.
@freezed
abstract class ApplicationError with _$ApplicationError implements Exception {
  const factory ApplicationError({
    required ApplicationErrorCode code,
    String? detail,
  }) = _ApplicationError;
}

enum ApplicationErrorCode {
  /// No connection, or the server couldn't be reached.
  connection,

  /// The server took too long to answer.
  timeout,

  /// The server failed or answered with something unexpected.
  server,

  /// Location services are switched off on the phone.
  locationDisabled,

  /// The person declined location access.
  locationDenied,

  /// Anything else; the cause is in [ApplicationError.detail].
  unknown,
}
