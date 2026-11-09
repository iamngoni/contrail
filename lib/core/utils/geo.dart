//
//  Contrail
//  geo.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:math' as math;

import 'package:latlong2/latlong.dart';

const double _earthKm = 6371;
const double kmPerNauticalMile = 1.852;

double _rad(double d) => d * math.pi / 180;
double _deg(double r) => r * 180 / math.pi;

/// Great-circle distance in kilometres.
double distanceKm(LatLng a, LatLng b) {
  final double dLat = _rad(b.latitude - a.latitude);
  final double dLon = _rad(b.longitude - a.longitude);
  final double h =
      math.pow(math.sin(dLat / 2), 2) +
      math.cos(_rad(a.latitude)) *
          math.cos(_rad(b.latitude)) *
          math.pow(math.sin(dLon / 2), 2);
  return 2 * _earthKm * math.asin(math.min(1, math.sqrt(h)));
}

/// Initial bearing from [a] to [b], 0..360.
double bearingDeg(LatLng a, LatLng b) {
  final double p1 = _rad(a.latitude);
  final double p2 = _rad(b.latitude);
  final double dl = _rad(b.longitude - a.longitude);
  final double y = math.sin(dl) * math.cos(p2);
  final double x =
      math.cos(p1) * math.sin(p2) - math.sin(p1) * math.cos(p2) * math.cos(dl);
  return (_deg(math.atan2(y, x)) + 360) % 360;
}

/// Points along the great circle between [a] and [b], excluding both ends.
List<LatLng> greatCircle(LatLng a, LatLng b, {int segments = 64}) {
  final double p1 = _rad(a.latitude);
  final double l1 = _rad(a.longitude);
  final double p2 = _rad(b.latitude);
  final double l2 = _rad(b.longitude);
  final double ax = math.cos(p1) * math.cos(l1);
  final double ay = math.cos(p1) * math.sin(l1);
  final double az = math.sin(p1);
  final double bx = math.cos(p2) * math.cos(l2);
  final double by = math.cos(p2) * math.sin(l2);
  final double bz = math.sin(p2);
  final double dot = (ax * bx + ay * by + az * bz).clamp(-1.0, 1.0);
  final double w = math.acos(dot);
  if (w < 1e-9) return const [];
  final List<LatLng> out = [];
  for (var i = 1; i < segments; i++) {
    final double f = i / segments;
    final double s1 = math.sin((1 - f) * w) / math.sin(w);
    final double s2 = math.sin(f * w) / math.sin(w);
    final double x = s1 * ax + s2 * bx;
    final double y = s1 * ay + s2 * by;
    final double z = s1 * az + s2 * bz;
    out.add(
      LatLng(
        _deg(math.atan2(z, math.sqrt(x * x + y * y))),
        _deg(math.atan2(y, x)),
      ),
    );
  }
  return out;
}

/// Splits a polyline where it crosses the antimeridian, so the map never
/// draws a line across the whole world.
List<List<LatLng>> splitAntimeridian(List<LatLng> points) {
  final List<List<LatLng>> out = [];
  List<LatLng> current = [];
  for (final LatLng p in points) {
    if (current.isNotEmpty &&
        (p.longitude - current.last.longitude).abs() > 180) {
      out.add(current);
      current = [];
    }
    current.add(p);
  }
  if (current.isNotEmpty) out.add(current);
  return out;
}

/// Eight-point compass direction for a bearing.
String compassPoint(double deg) {
  const List<String> names = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
  return names[((deg % 360) / 45).round() % 8];
}
