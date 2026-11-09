//
//  Contrail
//  bootstrap.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'core/configs/app_environment.dart';
import 'core/services/contrail_bloc_observer.dart';
import 'injection.dart';
import 'providers.dart';

Future<void> bootstrap(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  Bloc.observer = const ContrailBlocObserver();
  getIt.registerSingleton<AppEnvironment>(environment);
  configureDependencies();
  runApp(const ContrailProviders());
}
