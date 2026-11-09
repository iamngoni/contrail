//
//  Contrail
//  map_page.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/configs/app_environment.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/state/location/location_bloc.dart';
import '../../../core/utils/geo.dart';
import '../../../core/views/widgets/altitude_legend.dart';
import '../../../flight/models/data/flight_snapshot.dart';
import '../../../flight/state/flight/flight_bloc.dart';
import '../../../flight/views/widgets/flight_sheet.dart';
import '../../../injection.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../nearby/views/pages/nearby_page.dart';
import '../../../search/views/pages/search_page.dart';
import '../../models/data/aircraft.dart';
import '../../state/traffic/traffic_bloc.dart';
import '../widgets/map_attribution.dart';
import '../widgets/map_top_bar.dart';
import '../widgets/traffic_map.dart';
import '../widgets/traffic_status_pill.dart';

/// The home screen: live traffic on a full-screen map.
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  /// Tells the traffic BLoC what is visible now.
  void reportViewport(MapCamera camera, {bool immediate = false}) {
    final double radiusKm = distanceKm(
      camera.center,
      camera.visibleBounds.northEast,
    );
    context.read<TrafficBloc>().add(
      TrafficEvent.viewportChanged(
        center: camera.center,
        radiusNm: radiusKm / kmPerNauticalMile,
        immediate: immediate,
      ),
    );
  }

  void moveTo(LatLng point, double zoom) {
    mapController.move(point, zoom);
    reportViewport(mapController.camera, immediate: true);
  }

  void onMoved(MapCamera camera, {required bool byGesture}) {
    if (!byGesture) return;
    final FlightBloc flight = context.read<FlightBloc>();
    if (flight.state.following) {
      flight.add(const FlightEvent.followToggled(following: false));
    }
    reportViewport(camera);
  }

  void select(Aircraft aircraft, {bool fly = false}) {
    if (fly) {
      final double zoom = mapController.camera.zoom;
      moveTo(aircraft.position, zoom < 7 ? 8 : zoom);
    }
    context.read<FlightBloc>().add(FlightEvent.selected(aircraft: aircraft));
  }

  Future<void> openSearch() async {
    final List<Aircraft> visible = context.read<TrafficBloc>().state.aircraft;
    final Aircraft? picked = await Navigator.of(context).push<Aircraft>(
      SearchPage.route(visible: visible),
    );
    if (picked != null && mounted) select(picked, fly: true);
  }

  Future<void> openNearby() async {
    final LatLng? me = context.read<LocationBloc>().state.position;
    if (me == null) {
      context.read<LocationBloc>().add(const LocationEvent.requested());
      showMessage(AppLocalizations.of(context).locationNeededForNearby);
      return;
    }
    final Aircraft? picked = await Navigator.of(context).push<Aircraft>(
      NearbyPage.route(me: me),
    );
    if (picked != null && mounted) select(picked, fly: true);
  }

  void showMessage(String text) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));

  void onLocation(BuildContext context, LocationState state) {
    switch (state) {
      case LocationLocatedState(
        :final LatLng position,
        :final bool userInitiated,
      ):
        moveTo(
          position,
          userInitiated
              ? mapController.camera.zoom.clamp(8, 11)
              : TrafficMap.initialZoom,
        );
      case LocationUnavailableState(userInitiated: true):
        showMessage(AppLocalizations.of(context).locationOff);
      case _:
        break;
    }
  }

  void onFlight(BuildContext context, FlightState state) {
    final FlightSnapshot? snap = state.snapshot;
    if (state.following && snap != null) {
      mapController.move(snap.aircraft.position, mapController.camera.zoom);
    }
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<LocationBloc, LocationState>(listener: onLocation),
        BlocListener<FlightBloc, FlightState>(
          listenWhen: (FlightState a, FlightState b) =>
              b.following &&
              (a.snapshot?.aircraft.position != b.snapshot?.aircraft.position ||
                  !a.following),
          listener: onFlight,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<FlightBloc, FlightState>(
          builder: (BuildContext context, FlightState flight) => Stack(
            children: [
              BlocBuilder<TrafficBloc, TrafficState>(
                builder: (BuildContext context, TrafficState traffic) =>
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (BuildContext context, LocationState location) =>
                          TrafficMap(
                            controller: mapController,
                            environment: getIt<AppEnvironment>(),
                            aircraft: traffic.aircraft,
                            selected: flight.snapshot,
                            me: location.position,
                            onAircraftTap: select,
                            onMapTap: () => context.read<FlightBloc>().add(
                              const FlightEvent.cleared(),
                            ),
                            onMoved: onMoved,
                            onReady: () => reportViewport(
                              mapController.camera,
                              immediate: true,
                            ),
                          ),
                    ),
              ),
              Positioned(
                top: padding.top + AppSpacing.s8,
                left: AppSpacing.s16 - 2,
                right: AppSpacing.s16 - 2,
                child: MapTopBar(
                  onSearch: openSearch,
                  onNearby: openNearby,
                  onLocate: () => context.read<LocationBloc>().add(
                    const LocationEvent.requested(),
                  ),
                ),
              ),
              Positioned(
                right: AppSpacing.s16 - 2,
                top: padding.top + AppSpacing.s48 + AppSpacing.s24,
                child: const AltitudeLegend(),
              ),
              if (flight.snapshot == null) ...[
                Positioned(
                  left: AppSpacing.s16,
                  right: AppSpacing.s16,
                  bottom: padding.bottom + AppSpacing.s16,
                  child: Center(
                    child: BlocBuilder<TrafficBloc, TrafficState>(
                      builder: (BuildContext context, TrafficState traffic) =>
                          TrafficStatusPill(state: traffic),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: padding.bottom + 2,
                  child: const Center(child: MapAttribution()),
                ),
              ],
              if (flight.snapshot != null)
                FlightSheet(
                  key: ValueKey<String>(flight.snapshot!.aircraft.hex),
                  state: flight,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
