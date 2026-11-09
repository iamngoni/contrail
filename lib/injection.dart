//
//  Contrail
//  injection.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/configs/app_environment.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
void configureDependencies() => getIt.init();

@module
abstract class NetworkModule {
  /// Live positions and searches.
  @Named('adsbApi')
  @lazySingleton
  Dio adsbApi(AppEnvironment env) => _dio(env, env.adsbApiBase);

  /// Recorded tracks. Trace files are large, so allow longer reads.
  @Named('adsbData')
  @lazySingleton
  Dio adsbData(AppEnvironment env) =>
      _dio(env, env.adsbDataBase, receive: const Duration(seconds: 25));

  /// Crowd-sourced routes.
  @Named('adsbRoutes')
  @lazySingleton
  Dio adsbRoutes(AppEnvironment env) => _dio(env, env.adsbRoutesBase);

  static Dio _dio(
    AppEnvironment env,
    String baseUrl, {
    Duration receive = const Duration(seconds: 12),
  }) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: receive,
        headers: {'User-Agent': 'Contrail/1.0 (Flutter)'},
      ),
    );
    if (env.logsRequests) {
      dio.interceptors.add(
        LogInterceptor(requestHeader: false, responseHeader: false),
      );
    }
    return dio;
  }
}
