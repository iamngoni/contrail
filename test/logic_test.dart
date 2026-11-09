import 'dart:math' as math;

import 'package:contrail/data/adsb_api.dart';
import 'package:contrail/data/airlines.dart';
import 'package:contrail/data/models.dart';
import 'package:contrail/util/geo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

void main() {
  const jfk = LatLng(40.6398, -73.7789);
  const lhr = LatLng(51.4700, -0.4543);

  group('geo', () {
    test('JFK to LHR is about 5,540 km', () {
      expect(distanceKm(jfk, lhr), closeTo(5540, 15));
    });

    test('distance is symmetric and non-negative for random points (seed 42)', () {
      final r = math.Random(42);
      for (var i = 0; i < 500; i++) {
        final a = LatLng(r.nextDouble() * 170 - 85, r.nextDouble() * 360 - 180);
        final b = LatLng(r.nextDouble() * 170 - 85, r.nextDouble() * 360 - 180);
        expect(distanceKm(a, b), greaterThanOrEqualTo(0));
        expect(distanceKm(a, b), closeTo(distanceKm(b, a), 1e-6));
        expect(distanceKm(a, b), lessThanOrEqualTo(20016));
      }
    });

    test('great-circle points never make the path longer than the direct route (seed 7)', () {
      final r = math.Random(7);
      for (var i = 0; i < 200; i++) {
        final a = LatLng(r.nextDouble() * 140 - 70, r.nextDouble() * 360 - 180);
        final b = LatLng(r.nextDouble() * 140 - 70, r.nextDouble() * 360 - 180);
        final pts = [a, ...greatCircle(a, b, segments: 32), b];
        var len = 0.0;
        for (var j = 1; j < pts.length; j++) {
          len += distanceKm(pts[j - 1], pts[j]);
        }
        expect(len, closeTo(distanceKm(a, b), distanceKm(a, b) * 0.001 + 0.5));
      }
    });

    test('antimeridian split leaves no jump over 180 degrees', () {
      final path = [const LatLng(50, 170), const LatLng(51, 179), const LatLng(52, -179), const LatLng(53, -170)];
      for (final seg in splitAntimeridian(path)) {
        for (var i = 1; i < seg.length; i++) {
          expect((seg[i].longitude - seg[i - 1].longitude).abs(), lessThan(180));
        }
      }
    });
  });

  group('airlines', () {
    test('BA116 searches BAW116 too', () {
      expect(callsignCandidates('ba 116'), containsAll(['BA116', 'BAW116']));
    });
    test('BAW116 displays as BA116', () {
      expect(flightNumber('BAW116'), 'BA116');
      expect(flightNumber('N123AB'), 'N123AB');
    });
  });

  group('routes', () {
    Airport ap(String c, LatLng p) => Airport(iata: c, icao: c, name: c, city: c, position: p);
    final route = FlightRoute(airports: [ap('JFK', jfk), ap('LHR', lhr)], airlineCode: 'BAW');

    test('a plane over Ireland fits JFK to LHR', () {
      expect(AdsbApi.isPlausible(route, const LatLng(53.7, -7.4)), isTrue);
    });
    test('a plane over Johannesburg does not', () {
      expect(AdsbApi.isPlausible(route, const LatLng(-26.1, 28.2)), isFalse);
    });
  });

  group('trace', () {
    test('keeps only the current leg after the last ground contact', () {
      final t = AdsbApi.parseTrace({
        'timestamp': 1000,
        'trace': [
          [0, 40.6, -73.7, 'ground'],
          [60, 40.7, -73.6, 2000],
          [3600, 50, -20, 37000],
          [7200, 51.4, -0.4, 'ground'],
          [9000, 51.4, -0.4, 'ground'],
          [9100, 51.5, -0.3, 1500],
          [9400, 51.8, 0.5, 9000],
        ],
      })!;
      expect(t.points.first.onGround, isTrue);
      expect(t.points.length, 3);
      expect(t.points.last.altitudeFt, 9000);
      expect(t.departedAt, DateTime.fromMillisecondsSinceEpoch(10100 * 1000, isUtc: true));
    });
  });

  group('aircraft json', () {
    test('parses a readsb record and handles ground altitude', () {
      final a = Aircraft.fromJson({'hex': '407995', 'flight': 'BAW116  ', 'lat': 51.4, 'lon': -0.5, 'alt_baro': 'ground', 'squawk': '7700'})!;
      expect(a.callsign, 'BAW116');
      expect(a.onGround, isTrue);
      expect(a.isEmergency, isTrue);
      expect(Aircraft.fromJson({'hex': 'abc'}), isNull);
    });
  });
}
