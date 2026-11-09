// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/configs/app_environment.dart' as _i192;
import 'core/services/location_service.dart' as _i65;
import 'core/state/location/location_bloc.dart' as _i304;
import 'flight/models/repos/abs/flight_repository.dart' as _i581;
import 'flight/models/repos/impl/dio_flight_repository.dart' as _i960;
import 'flight/state/flight/flight_bloc.dart' as _i18;
import 'injection.dart' as _i464;
import 'nearby/state/nearby/nearby_bloc.dart' as _i827;
import 'search/state/search/search_bloc.dart' as _i696;
import 'traffic/models/repos/abs/traffic_repository.dart' as _i894;
import 'traffic/models/repos/impl/dio_traffic_repository.dart' as _i129;
import 'traffic/state/traffic/traffic_bloc.dart' as _i94;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i65.LocationService>(() => _i65.LocationService());
    gh.factory<_i304.LocationBloc>(
      () => _i304.LocationBloc(gh<_i65.LocationService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.adsbData(gh<_i192.AppEnvironment>()),
      instanceName: 'adsbData',
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.adsbApi(gh<_i192.AppEnvironment>()),
      instanceName: 'adsbApi',
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.adsbRoutes(gh<_i192.AppEnvironment>()),
      instanceName: 'adsbRoutes',
    );
    gh.lazySingleton<_i894.TrafficRepository>(
      () => _i129.DioTrafficRepository(gh<_i361.Dio>(instanceName: 'adsbApi')),
    );
    gh.lazySingleton<_i581.FlightRepository>(
      () => _i960.DioFlightRepository(
        gh<_i361.Dio>(instanceName: 'adsbRoutes'),
        gh<_i361.Dio>(instanceName: 'adsbData'),
      ),
    );
    gh.factory<_i827.NearbyBloc>(
      () => _i827.NearbyBloc(gh<_i894.TrafficRepository>()),
    );
    gh.factory<_i696.SearchBloc>(
      () => _i696.SearchBloc(gh<_i894.TrafficRepository>()),
    );
    gh.factory<_i94.TrafficBloc>(
      () => _i94.TrafficBloc(gh<_i894.TrafficRepository>()),
    );
    gh.factory<_i18.FlightBloc>(
      () => _i18.FlightBloc(
        gh<_i581.FlightRepository>(),
        gh<_i894.TrafficRepository>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i464.NetworkModule {}
