//
//  Contrail
//  flight_models_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:contrail/core/utils/geo.dart';
import 'package:contrail/flight/models/data/flight_phase.dart';
import 'package:contrail/flight/models/data/flight_route.dart';
import 'package:contrail/flight/models/data/flight_snapshot.dart';
import 'package:contrail/flight/models/data/flight_track.dart';
import 'package:contrail/flight/models/data/trace_point.dart';
import 'package:contrail/flight/models/dto/route_dto.dart';
import 'package:contrail/flight/models/dto/trace_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

import '../helpers/fixtures.dart';

void main() {
  group('RouteDTO', () {
    test('parses the route database format', () {
      final FlightRoute? r = RouteDTO.fromJson(const {
        'callsign': 'BAW116',
        'airline_code': 'BAW',
        '_airports': [
          {
            'name': 'John F Kennedy International Airport',
            'icao': 'KJFK',
            'iata': 'JFK',
            'location': 'New York',
            'lat': 40.639801,
            'lon': -73.7789,
          },
          {
            'name': 'London Heathrow Airport',
            'icao': 'EGLL',
            'iata': 'LHR',
            'location': 'London',
            'lat': 51.4706,
            'lon': -0.461941,
          },
        ],
      }).toDomain();
      expect(r?.origin.code, 'JFK');
      expect(r?.destination.city, 'London');
      expect(r?.airlineCode, 'BAW');
      expect(r?.stops, isEmpty);
    });

    test('a single airport is not a route', () {
      expect(
        RouteDTO.fromJson(const {
          '_airports': [
            {'iata': 'JFK', 'lat': 40.6, 'lon': -73.7},
          ],
        }).toDomain(),
        isNull,
      );
    });
  });

  group('FlightRoute plausibility', () {
    test('a plane over Ireland fits JFK to LHR', () {
      expect(jfkToLhr.isPlausibleAt(const LatLng(53.7, -7.4)), isTrue);
    });

    test('a plane over Johannesburg does not', () {
      expect(jfkToLhr.isPlausibleAt(const LatLng(-26.1, 28.2)), isFalse);
    });
  });

  group('TraceDTO', () {
    test('keeps only the leg after the last ground contact', () {
      final FlightTrack t = TraceDTO.fromJson(const {
        'timestamp': 1000,
        'trace': [
          [0, 40.6, -73.7, 'ground'],
          [60, 40.7, -73.6, 2000],
          [3600, 50, -20, 37000],
          [7200, 51.4, -0.4, 'ground'],
          [9000, 51.4, -0.4, 'ground'],
          [9100, 51.5, -0.3, 1500, 180, 90, 0, 1200, null],
          [9400, 51.8, 0.5, 9000],
          [9500, 'bad', 0.5, 9000],
        ],
      }).toDomain()!;
      expect(t.points.length, 3);
      expect(t.points.first.onGround, isTrue);
      expect(t.points.last.altitudeFt, 9000);
      expect(
        t.departedAt,
        DateTime.fromMillisecondsSinceEpoch(10100 * 1000, isUtc: true),
      );
    });

    test('a long low-altitude coverage gap starts a new leg', () {
      final FlightTrack t = TraceDTO.fromJson(const {
        'timestamp': 0,
        'trace': [
          [0, 10, 10, 3000],
          [600, 10.5, 10.5, 5000],
          [6000, 20, 20, 2000],
          [6300, 20.5, 20.5, 6000],
        ],
      }).toDomain()!;
      expect(t.points.length, 2);
      expect(t.points.first.position, const LatLng(20, 20));
    });

    test('no usable points means no track', () {
      expect(
        TraceDTO.fromJson(const {
          'timestamp': 0,
          'trace': <List<Object?>>[],
        }).toDomain(),
        isNull,
      );
    });
  });

  group('FlightSnapshot', () {
    test('progress, remaining distance and ETA follow the route', () {
      final FlightSnapshot s = FlightSnapshot(
        aircraft: aircraft(
          position: const LatLng(53.7, -7.4),
          altitudeFt: 37000,
          verticalRateFpm: 0,
          groundSpeedKt: 480,
        ),
        route: jfkToLhr,
      );
      expect(s.progress, closeTo(0.92, 0.03));
      expect(s.remainingKm, closeTo(distanceKm(s.aircraft.position, lhr), 1));
      expect(s.eta!.inMinutes, inInclusiveRange(35, 55));
      expect(s.phase, FlightPhase.cruising);
    });

    test('low, descending and close to the destination is final approach', () {
      final FlightSnapshot s = FlightSnapshot(
        aircraft: aircraft(),
        route: jfkToLhr,
      );
      expect(s.phase, FlightPhase.finalApproach);
    });

    test('ocean gaps are bridged along the great circle', () {
      final FlightSnapshot s = FlightSnapshot(
        aircraft: aircraft(position: const LatLng(55.5, -11.9)),
        track: FlightTrack(
          points: [
            TracePoint(
              time: DateTime.utc(2026),
              position: const LatLng(47.2, -62.1),
              altitudeFt: 35000,
              onGround: false,
            ),
          ],
        ),
      );
      final List<LatLng> path = s.flownPath;
      expect(path.length, greaterThan(40));
      for (var i = 1; i < path.length; i++) {
        expect(
          distanceKm(path[i - 1], path[i]),
          lessThan(FlightSnapshot.gapKm),
        );
      }
    });

    test('without a route there is no progress or ETA', () {
      final FlightSnapshot s = FlightSnapshot(aircraft: aircraft());
      expect(s.progress, isNull);
      expect(s.eta, isNull);
      expect(s.phase, FlightPhase.descending);
    });
  });
}
