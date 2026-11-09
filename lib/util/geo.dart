import 'dart:math' as math;

import 'package:latlong2/latlong.dart';

const double _earthKm = 6371.0;
const double kmPerNm = 1.852;

double _rad(double d) => d * math.pi / 180;
double _deg(double r) => r * 180 / math.pi;

/// Great-circle distance in kilometres.
double distanceKm(LatLng a, LatLng b) {
  final dLat = _rad(b.latitude - a.latitude);
  final dLon = _rad(b.longitude - a.longitude);
  final h = math.pow(math.sin(dLat / 2), 2) +
      math.cos(_rad(a.latitude)) *
          math.cos(_rad(b.latitude)) *
          math.pow(math.sin(dLon / 2), 2);
  return 2 * _earthKm * math.asin(math.min(1, math.sqrt(h)));
}

/// Initial bearing from [a] to [b], 0..360.
double bearingDeg(LatLng a, LatLng b) {
  final p1 = _rad(a.latitude), p2 = _rad(b.latitude);
  final dl = _rad(b.longitude - a.longitude);
  final y = math.sin(dl) * math.cos(p2);
  final x = math.cos(p1) * math.sin(p2) - math.sin(p1) * math.cos(p2) * math.cos(dl);
  return (_deg(math.atan2(y, x)) + 360) % 360;
}

/// Points along the great circle between [a] and [b] (exclusive of both ends).
List<LatLng> greatCircle(LatLng a, LatLng b, {int segments = 64}) {
  final p1 = _rad(a.latitude), l1 = _rad(a.longitude);
  final p2 = _rad(b.latitude), l2 = _rad(b.longitude);
  final ax = math.cos(p1) * math.cos(l1), ay = math.cos(p1) * math.sin(l1), az = math.sin(p1);
  final bx = math.cos(p2) * math.cos(l2), by = math.cos(p2) * math.sin(l2), bz = math.sin(p2);
  final dot = (ax * bx + ay * by + az * bz).clamp(-1.0, 1.0);
  final w = math.acos(dot);
  if (w < 1e-9) return const [];
  final out = <LatLng>[];
  for (var i = 1; i < segments; i++) {
    final f = i / segments;
    final s1 = math.sin((1 - f) * w) / math.sin(w);
    final s2 = math.sin(f * w) / math.sin(w);
    final x = s1 * ax + s2 * bx, y = s1 * ay + s2 * by, z = s1 * az + s2 * bz;
    out.add(LatLng(_deg(math.atan2(z, math.sqrt(x * x + y * y))), _deg(math.atan2(y, x))));
  }
  return out;
}

/// Splits a polyline wherever it crosses the antimeridian so the map does not
/// draw a line across the whole world.
List<List<LatLng>> splitAntimeridian(List<LatLng> pts) {
  final out = <List<LatLng>>[];
  var cur = <LatLng>[];
  for (final p in pts) {
    if (cur.isNotEmpty && (p.longitude - cur.last.longitude).abs() > 180) {
      out.add(cur);
      cur = <LatLng>[];
    }
    cur.add(p);
  }
  if (cur.isNotEmpty) out.add(cur);
  return out;
}

String compass(double deg) {
  const names = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
  return names[((deg % 360) / 45).round() % 8];
}
