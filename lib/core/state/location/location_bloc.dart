//
//  Contrail
//  location_bloc.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../../models/data/application_error.dart';
import '../../services/location_service.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

/// Where the person is, for centring the map and the "above you" list.
@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this._location) : super(const LocationState.initial()) {
    on<LocationRequestedEvent>(_onRequested, transformer: droppable());
  }

  final LocationService _location;

  Future<void> _onRequested(
    LocationRequestedEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationState.locating(previous: state.position));
    final Either<ApplicationError, LatLng> result = await _location.current();
    result.fold(
      (ApplicationError error) => emit(
        LocationState.unavailable(
          error: error,
          userInitiated: event.userInitiated,
        ),
      ),
      (LatLng position) => emit(
        LocationState.located(
          position: position,
          userInitiated: event.userInitiated,
        ),
      ),
    );
  }
}
