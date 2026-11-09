//
//  Contrail
//  flight_snapshot.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/utils/geo.dart';
import '../../../traffic/models/data/aircraft.dart';
import 'flight_phase.dart';
import 'flight_route.dart';
import 'flight_track.dart';
import 'trace_point.dart';

part 'flight_snapshot.freezed.dart';

/// Everything known about the selected flight right now, and what follows
/// from it: path, progress, ETA and phase.
@freezed
abstract class FlightSnapshot with _$FlightSnapshot {
  const factory FlightSnapshot({
    required Aircraft aircraft,
    FlightRoute? route,
    FlightTrack? track,
  }) = _FlightSnapshot;

  const FlightSnapshot._();

  /// Gaps longer than this (oceans, poor coverage) are bridged along the
  /// great circle rather than drawn as straight map lines.
  static const double gapKm = 150;

  /// Trace points plus the latest live position, with coverage gaps filled.
  List<LatLng> get flownPath {
    final List<LatLng> points = [
      ...?track?.points.map((TracePoint p) => p.position),
    ];
    if (points.isEmpty || distanceKm(points.last, aircraft.position) > 0.2) {
      points.add(aircraft.position);
    }
    final List<LatLng> out = [];
    for (final LatLng p in points) {
      if (out.isNotEmpty && distanceKm(out.last, p) > gapKm) {
        out.addAll(greatCircle(out.last, p, segments: 48));
      }
      out.add(p);
    }
    return out;
  }

  /// Altitude at each point of [flownPath]'s source points, plus now.
  List<int> get altitudes => [
    ...?track?.points.map((TracePoint p) => p.altitudeFt),
    aircraft.altitudeFt ?? 0,
  ];

  double? get remainingKm {
    final FlightRoute? r = route;
    return r == null
        ? null
        : distanceKm(aircraft.position, r.destination.position);
  }

  double? get totalKm {
    final FlightRoute? r = route;
    final double? remaining = remainingKm;
    if (r == null || remaining == null) return null;
    return distanceKm(r.origin.position, aircraft.position) + remaining;
  }

  double? get flownKm {
    final double? total = totalKm;
    final double? remaining = remainingKm;
    return total == null || remaining == null ? null : total - remaining;
  }

  double? get progress {
    final double? total = totalKm;
    final double? remaining = remainingKm;
    if (total == null || remaining == null || total <= 0) return null;
    return (1 - remaining / total).clamp(0.0, 1.0);
  }

  /// Rough time to landing: remaining distance at current ground speed,
  /// plus a few minutes for the approach.
  Duration? get eta {
    final double? remaining = remainingKm;
    final double? gs = aircraft.groundSpeedKt;
    if (remaining == null || gs == null || gs < 60 || aircraft.onGround) {
      return null;
    }
    final double minutes =
        remaining / (gs * kmPerNauticalMile) * 60 + (remaining > 150 ? 8 : 2);
    return Duration(minutes: minutes.round());
  }

  FlightPhase get phase {
    if (aircraft.onGround) return FlightPhase.onGround;
    final int vr = aircraft.verticalRateFpm ?? 0;
    final int alt = aircraft.altitudeFt ?? 0;
    final double? remaining = remainingKm;
    if (remaining != null && remaining < 25 && alt < 4000 && vr < 0) {
      return FlightPhase.finalApproach;
    }
    if (vr > 500) return FlightPhase.climbing;
    if (vr < -500) return FlightPhase.descending;
    return alt > 18000 ? FlightPhase.cruising : FlightPhase.level;
  }
}
