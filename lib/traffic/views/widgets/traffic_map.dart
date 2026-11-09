//
//  Contrail
//  traffic_map.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_environment.dart';
import '../../../flight/models/data/airport.dart';
import '../../../flight/models/data/flight_snapshot.dart';
import '../../../flight/views/widgets/airport_marker.dart';
import '../../../flight/views/widgets/flight_path_layer.dart';
import '../../../flight/views/widgets/selected_aircraft_marker.dart';
import '../../models/data/aircraft.dart';
import 'aircraft_marker.dart';
import 'ground_aircraft_marker.dart';
import 'my_location_marker.dart';

/// The dark base map with live traffic, the selected flight and the
/// person's position.
class TrafficMap extends StatelessWidget {
  const TrafficMap({
    required this.controller,
    required this.environment,
    required this.aircraft,
    required this.selected,
    required this.me,
    required this.onAircraftTap,
    required this.onMapTap,
    required this.onMoved,
    required this.onReady,
    super.key,
  });

  final MapController controller;
  final AppEnvironment environment;
  final List<Aircraft> aircraft;
  final FlightSnapshot? selected;
  final LatLng? me;
  final ValueChanged<Aircraft> onAircraftTap;
  final VoidCallback onMapTap;
  final void Function(MapCamera camera, {required bool byGesture}) onMoved;
  final VoidCallback onReady;

  static const LatLng initialCenter = LatLng(51.47, -0.45);
  static const double initialZoom = 8.5;

  /// Darkens the tiles slightly so traffic stands out.
  static const ColorFilter tileTint = ColorFilter.matrix([
    0.82, 0, 0, 0, -6, //
    0, 0.82, 0, 0, -6, //
    0, 0, 0.86, 0, -4, //
    0, 0, 0, 1, 0,
  ]);

  @override
  Widget build(BuildContext context) {
    final FlightSnapshot? sel = selected;
    final String? selectedHex = sel?.aircraft.hex;
    final LatLng? myPosition = me;
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: initialZoom,
        minZoom: 2,
        maxZoom: 15,
        backgroundColor: AppColors.mapBackground,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (_, _) => onMapTap(),
        onPositionChanged: (MapCamera camera, bool hasGesture) =>
            onMoved(camera, byGesture: hasGesture),
        onMapReady: onReady,
      ),
      children: [
        TileLayer(
          urlTemplate: environment.tileUrlTemplate,
          userAgentPackageName: 'com.iamngoni.contrail',
          maxNativeZoom: 16,
          retinaMode: RetinaMode.isHighDensity(context),
          tileBuilder: (BuildContext context, Widget tile, _) =>
              ColorFiltered(colorFilter: tileTint, child: tile),
        ),
        if (sel != null) FlightPathLayer(snapshot: sel),
        MarkerLayer(
          markers: [
            for (final Aircraft a in aircraft)
              if (a.hex != selectedHex)
                a.onGround
                    ? Marker(
                        point: a.position,
                        width: 18,
                        height: 18,
                        child: GroundAircraftMarker(
                          onTap: () => onAircraftTap(a),
                        ),
                      )
                    : Marker(
                        point: a.position,
                        width: 32,
                        height: 32,
                        child: AircraftMarker(
                          aircraft: a,
                          dimmed: sel != null,
                          onTap: () => onAircraftTap(a),
                        ),
                      ),
            if (sel != null) ...[
              for (final Airport ap in sel.route?.airports ?? const <Airport>[])
                Marker(
                  point: ap.position,
                  width: 60,
                  height: 34,
                  child: AirportMarker(code: ap.code),
                ),
              Marker(
                point: sel.aircraft.position,
                width: 64,
                height: 64,
                child: SelectedAircraftMarker(
                  headingDeg: sel.aircraft.trackDeg ?? 0,
                ),
              ),
            ],
            if (myPosition != null)
              Marker(
                point: myPosition,
                width: 22,
                height: 22,
                child: const MyLocationMarker(),
              ),
          ],
        ),
      ],
    );
  }
}
