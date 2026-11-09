//
//  Contrail
//  trace_dto.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../data/flight_track.dart';
import '../data/trace_point.dart';

part 'trace_dto.freezed.dart';
part 'trace_dto.g.dart';

/// An aircraft's recorded positions in readsb trace format: each entry is
/// `[secondsAfterTimestamp, lat, lon, altitude|"ground", ...]`.
@freezed
abstract class TraceDTO with _$TraceDTO {
  const factory TraceDTO({
    required double timestamp,
    @Default(<List<Object?>>[]) List<List<Object?>> trace,
  }) = _TraceDTO;

  const TraceDTO._();

  factory TraceDTO.fromJson(Map<String, dynamic> json) =>
      _$TraceDTOFromJson(json);

  /// A coverage gap this long at low altitude means a new leg began.
  static const int legGapMinutes = 45;

  /// The current leg only: from the last take-off to the newest point.
  FlightTrack? toDomain() {
    final List<TracePoint> points = [];
    for (final List<Object?> e in trace) {
      if (e.length < 4) continue;
      final Object? dt = e[0];
      final Object? lat = e[1];
      final Object? lon = e[2];
      final Object? alt = e[3];
      if (dt is! num || lat is! num || lon is! num) continue;
      final bool ground = alt == 'ground';
      if (!ground && alt is! num) continue;
      points.add(
        TracePoint(
          time: DateTime.fromMillisecondsSinceEpoch(
            ((timestamp + dt) * 1000).round(),
            isUtc: true,
          ),
          position: LatLng(lat.toDouble(), lon.toDouble()),
          altitudeFt: alt is num ? alt.round() : 0,
          onGround: ground,
        ),
      );
    }
    if (points.isEmpty) return null;
    var start = 0;
    for (var i = points.length - 1; i > 0; i--) {
      final TracePoint prev = points[i - 1];
      final TracePoint cur = points[i];
      if (prev.onGround && !cur.onGround) {
        start = i - 1;
        break;
      }
      final int gap = cur.time.difference(prev.time).inMinutes;
      if (gap > legGapMinutes &&
          math.min(cur.altitudeFt, prev.altitudeFt) < 10000) {
        start = i;
        break;
      }
    }
    final List<TracePoint> leg = points.sublist(start);
    final TracePoint firstAirborne = leg.firstWhere(
      (TracePoint p) => !p.onGround,
      orElse: () => leg.first,
    );
    return FlightTrack(points: leg, departedAt: firstAirborne.time);
  }
}
