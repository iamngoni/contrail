//
//  Contrail
//  providers.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/state/location/location_bloc.dart';
import 'flight/state/flight/flight_bloc.dart';
import 'injection.dart';
import 'traffic/state/traffic/traffic_bloc.dart';

/// The app-wide BLoCs, above every route.
class ContrailProviders extends StatelessWidget {
  const ContrailProviders({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<TrafficBloc>(
        lazy: false,
        create: (_) => getIt<TrafficBloc>()..add(const TrafficEvent.started()),
      ),
      BlocProvider<FlightBloc>(create: (_) => getIt<FlightBloc>()),
      BlocProvider<LocationBloc>(
        lazy: false,
        create: (_) =>
            getIt<LocationBloc>()
              ..add(const LocationEvent.requested(userInitiated: false)),
      ),
    ],
    child: const ContrailApp(),
  );
}
