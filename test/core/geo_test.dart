//
//  Contrail
//  geo_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:math' as math;

import 'package:contrail/core/utils/geo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

import '../helpers/fixtures.dart';

LatLng _random(math.Random r, {double maxLat = 85}) => LatLng(
  r.nextDouble() * 2 * maxLat - maxLat,
  r.nextDouble() * 360 - 180,
);

void main() {
  test('JFK to LHR is about 5,540 km', () {
    expect(distanceKm(jfk, lhr), closeTo(5540, 15));
  });

  test('distance is symmetric, non-negative and bounded (seed 42)', () {
    final math.Random r = math.Random(42);
    for (var i = 0; i < 500; i++) {
      final LatLng a = _random(r);
      final LatLng b = _random(r);
      expect(distanceKm(a, b), inInclusiveRange(0, 20016));
      expect(distanceKm(a, b), closeTo(distanceKm(b, a), 1e-6));
    }
  });

  test('a great-circle path is as long as the direct distance (seed 7)', () {
    final math.Random r = math.Random(7);
    for (var i = 0; i < 200; i++) {
      final LatLng a = _random(r, maxLat: 70);
      final LatLng b = _random(r, maxLat: 70);
      final List<LatLng> pts = [a, ...greatCircle(a, b, segments: 32), b];
      var length = 0.0;
      for (var j = 1; j < pts.length; j++) {
        length += distanceKm(pts[j - 1], pts[j]);
      }
      final double direct = distanceKm(a, b);
      expect(length, closeTo(direct, direct * 0.001 + 0.5));
    }
  });

  test('antimeridian split never leaves a jump over 180 degrees (seed 3)', () {
    final math.Random r = math.Random(3);
    for (var i = 0; i < 100; i++) {
      final List<LatLng> path = [for (var j = 0; j < 20; j++) _random(r)];
      final List<List<LatLng>> segments = splitAntimeridian(path);
      expect(segments.expand((List<LatLng> s) => s).length, path.length);
      for (final List<LatLng> seg in segments) {
        for (var j = 1; j < seg.length; j++) {
          expect(
            (seg[j].longitude - seg[j - 1].longitude).abs(),
            lessThanOrEqualTo(180),
          );
        }
      }
    }
  });

  test('bearing is always within 0..360 (seed 11)', () {
    final math.Random r = math.Random(11);
    for (var i = 0; i < 300; i++) {
      expect(bearingDeg(_random(r), _random(r)), inInclusiveRange(0, 360));
    }
    expect(compassPoint(bearingDeg(lhr, jfk)), 'W');
  });
}
