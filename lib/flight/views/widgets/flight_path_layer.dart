//
//  Contrail
//  flight_path_layer.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/utils/geo.dart';
import '../../models/data/flight_snapshot.dart';

/// The flown track coloured by altitude, and the route ahead dashed.
class FlightPathLayer extends StatelessWidget {
  const FlightPathLayer({required this.snapshot, super.key});

  final FlightSnapshot snapshot;

  /// Upper bound on gradient stops, to keep painting cheap on long flights.
  static const int maxStops = 80;

  @override
  Widget build(BuildContext context) =>
      PolylineLayer(polylines: [...flownLines(), ...aheadLines()]);

  List<Polyline> flownLines() {
    final List<LatLng> path = snapshot.flownPath;
    if (path.length < 2) return const [];
    final List<int> alts = snapshot.altitudes;
    final List<double> cum = [0];
    for (var i = 1; i < path.length; i++) {
      cum.add(cum.last + distanceKm(path[i - 1], path[i]));
    }
    final double total = cum.last <= 0 ? 1 : cum.last;
    final List<Color> colors = [];
    final List<double> stops = [];
    final int step = (path.length / maxStops).ceil().clamp(1, path.length);
    for (var i = 0; i < path.length; i += step) {
      final int altIndex = ((i / (path.length - 1)) * (alts.length - 1))
          .round();
      colors.add(AppColors.altitude(alts[altIndex]));
      stops.add(cum[i] / total);
    }
    colors.add(
      AppColors.altitude(
        snapshot.aircraft.altitudeFt,
        onGround: snapshot.aircraft.onGround,
      ),
    );
    stops.add(1);
    final List<List<LatLng>> segments = splitAntimeridian(path);
    return [
      for (final List<LatLng> seg in segments)
        if (seg.length >= 2) ...[
          Polyline(
            points: seg,
            strokeWidth: 9,
            color: Colors.white.withValues(alpha: 0.05),
          ),
          Polyline(
            points: seg,
            strokeWidth: 2.6,
            color: AppColors.altitude(snapshot.aircraft.altitudeFt),
            gradientColors: segments.length == 1 ? colors : null,
            colorsStop: segments.length == 1 ? stops : null,
          ),
        ],
    ];
  }

  List<Polyline> aheadLines() {
    final LatLng? dest = snapshot.route?.destination.position;
    if (dest == null || snapshot.aircraft.onGround) return const [];
    final LatLng at = snapshot.aircraft.position;
    return [
      for (final List<LatLng> seg in splitAntimeridian([
        at,
        ...greatCircle(at, dest),
        dest,
      ]))
        Polyline(
          points: seg,
          strokeWidth: 1.6,
          color: Colors.white.withValues(alpha: 0.45),
          pattern: StrokePattern.dashed(segments: const [2, 7]),
        ),
    ];
  }
}
