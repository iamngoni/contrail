import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../util/geo.dart';
import 'models.dart';

/// Client for the free, open adsb.lol network.
///
/// * Live positions: https://api.adsb.lol/v2/...
/// * Flown tracks:   https://adsb.lol/data/traces/...
/// * Routes:         https://vrs-standing-data.adsb.lol/routes/...
class AdsbApi {
  AdsbApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const _headers = {'User-Agent': 'Contrail/1.0 (Flutter; iOS)'};

  final Map<String, FlightRoute?> _routeCache = {};

  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final res = await _client.get(uri, headers: _headers).timeout(const Duration(seconds: 12));
      if (res.statusCode != 200) return null;
      return jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  List<Aircraft> _parseAc(Map<String, dynamic>? j) {
    final list = (j?['ac'] as List?) ?? const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(Aircraft.fromJson)
        .whereType<Aircraft>()
        .toList();
  }

  /// Every aircraft within [radiusNm] nautical miles (max 250) of [center].
  Future<List<Aircraft>?> aircraftAround(LatLng center, double radiusNm) async {
    final r = radiusNm.clamp(1, 250).round();
    final j = await _getJson(Uri.parse(
        'https://api.adsb.lol/v2/point/${center.latitude.toStringAsFixed(4)}/${center.longitude.toStringAsFixed(4)}/$r'));
    if (j == null) return null;
    return _parseAc(j);
  }

  Future<Aircraft?> byHex(String hex) async =>
      _parseAc(await _getJson(Uri.parse('https://api.adsb.lol/v2/hex/$hex'))).firstOrNil;

  Future<List<Aircraft>> byCallsign(String cs) async =>
      _parseAc(await _getJson(Uri.parse('https://api.adsb.lol/v2/callsign/${Uri.encodeComponent(cs)}')));

  Future<List<Aircraft>> byRegistration(String reg) async =>
      _parseAc(await _getJson(Uri.parse('https://api.adsb.lol/v2/reg/${Uri.encodeComponent(reg)}')));

  Future<List<Aircraft>> byType(String type) async =>
      _parseAc(await _getJson(Uri.parse('https://api.adsb.lol/v2/type/${Uri.encodeComponent(type)}')));

  /// Origin and destination for a callsign from the crowd-sourced route database.
  /// Returns null when unknown, or when the route makes no sense for where the
  /// aircraft actually is (the database is sometimes stale).
  Future<FlightRoute?> route(String callsign, LatLng at) async {
    final cs = callsign.trim().toUpperCase();
    if (cs.length < 3) return null;
    if (!_routeCache.containsKey(cs)) {
      final j = await _getJson(
          Uri.parse('https://vrs-standing-data.adsb.lol/routes/${cs.substring(0, 2)}/$cs.json'));
      final airports = ((j?['_airports'] as List?) ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(Airport.fromJson)
          .whereType<Airport>()
          .toList();
      _routeCache[cs] = airports.length >= 2
          ? FlightRoute(airports: airports, airlineCode: j?['airline_code'] as String?)
          : null;
    }
    final r = _routeCache[cs];
    if (r == null) return null;
    return isPlausible(r, at) ? r : null;
  }

  /// True when [at] lies roughly on the way between some consecutive pair of
  /// airports on the route.
  static bool isPlausible(FlightRoute r, LatLng at) {
    for (var i = 0; i < r.airports.length - 1; i++) {
      final a = r.airports[i].position, b = r.airports[i + 1].position;
      final direct = distanceKm(a, b);
      final via = distanceKm(a, at) + distanceKm(at, b);
      if (via <= direct * 1.3 + 250) return true;
    }
    return false;
  }

  /// The current leg flown by [hex], reconstructed from its trace.
  Future<FlightTrack?> track(String hex) async {
    final h = hex.toLowerCase();
    final j = await _getJson(Uri.parse(
        'https://adsb.lol/data/traces/${h.substring(h.length - 2)}/trace_full_$h.json'));
    if (j == null) return null;
    return parseTrace(j);
  }

  static FlightTrack? parseTrace(Map<String, dynamic> j) {
    final base = (j['timestamp'] as num?)?.toDouble();
    final raw = (j['trace'] as List?) ?? const [];
    if (base == null || raw.isEmpty) return null;
    final pts = <TracePoint>[];
    for (final e in raw) {
      if (e is! List || e.length < 4) continue;
      final lat = (e[1] as num?)?.toDouble(), lon = (e[2] as num?)?.toDouble();
      if (lat == null || lon == null) continue;
      final ground = e[3] == 'ground';
      final alt = ground ? 0 : (e[3] as num?)?.round();
      if (alt == null && !ground) continue;
      pts.add(TracePoint(
        time: DateTime.fromMillisecondsSinceEpoch(((base + (e[0] as num)) * 1000).round(), isUtc: true),
        position: LatLng(lat, lon),
        altitudeFt: alt ?? 0,
        onGround: ground,
      ));
    }
    if (pts.isEmpty) return null;
    // Walk back from the newest point to the start of this leg: the last ground
    // contact before it, or a long gap in coverage at low altitude.
    var start = 0;
    for (var i = pts.length - 1; i > 0; i--) {
      final gap = pts[i].time.difference(pts[i - 1].time).inMinutes;
      if (pts[i - 1].onGround && !pts[i].onGround) {
        start = i - 1;
        break;
      }
      if (gap > 45 && math.min(pts[i].altitudeFt, pts[i - 1].altitudeFt) < 10000) {
        start = i;
        break;
      }
    }
    final leg = pts.sublist(start);
    final firstAir = leg.firstWhere((p) => !p.onGround, orElse: () => leg.first);
    return FlightTrack(points: leg, departedAt: firstAir.time);
  }
}

extension _FirstOrNull<T> on List<T> {
  T? get firstOrNil => isEmpty ? null : first;
}
