//
//  Contrail
//  contrail_bloc_observer.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:developer';

import 'package:bloc/bloc.dart';

/// Logs BLoC failures with their stack traces.
class ContrailBlocObserver extends BlocObserver {
  const ContrailBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'BLoC error in ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      name: 'contrail',
    );
    super.onError(bloc, error, stackTrace);
  }
}
