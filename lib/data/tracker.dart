import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

import '../util/geo.dart';
import 'adsb_api.dart';
import 'models.dart';

/// Everything known about the aircraft the person has selected.
class Selection {
  Selection({required this.aircraft, this.route, this.track, this.loadingDetails = true});

  Aircraft aircraft;
  FlightRoute? route;
  FlightTrack? track;
  bool loadingDetails;

  /// Flown path: trace points plus the latest live position, with any long
  /// coverage gap (oceans) filled in along the great circle.
  List<LatLng> get flownPath {
    final pts = <LatLng>[...?track?.points.map((p) => p.position)];
    final live = aircraft.position;
    if (pts.isEmpty || distanceKm(pts.last, live) > 0.2) pts.add(live);
    final out = <LatLng>[];
    for (final p in pts) {
      if (out.isNotEmpty && distanceKm(out.last, p) > 150) {
        out.addAll(greatCircle(out.last, p, segments: 48));
      }
      out.add(p);
    }
    return out;
  }

  double? get remainingKm =>
      route == null ? null : distanceKm(aircraft.position, route!.destination.position);

  double? get totalKm => route == null
      ? null
      : distanceKm(route!.origin.position, aircraft.position) + remainingKm!;

  double? get progress {
    final t = totalKm, r = remainingKm;
    if (t == null || r == null || t <= 0) return null;
    return (1 - r / t).clamp(0.0, 1.0);
  }

  /// Rough time to arrival: remaining distance at current ground speed, plus a
  /// few minutes for the approach when still far out.
  Duration? get eta {
    final r = remainingKm, gs = aircraft.groundSpeedKt;
    if (r == null || gs == null || gs < 60 || aircraft.onGround) return null;
    final minutes = r / (gs * kmPerNm) * 60 + (r > 150 ? 8 : 2);
    return Duration(minutes: minutes.round());
  }

  String get phase {
    final a = aircraft;
    if (a.onGround) return 'On ground';
    final vr = a.verticalRateFpm ?? 0;
    final alt = a.altitudeFt ?? 0;
    final r = remainingKm;
    if (r != null && r < 25 && alt < 4000 && vr < 0) return 'Final approach';
    if (vr > 500) return 'Climbing';
    if (vr < -500) return 'Descending';
    return alt > 18000 ? 'Cruising' : 'Level';
  }
}

class Tracker extends ChangeNotifier {
  Tracker(this.api);

  final AdsbApi api;

  List<Aircraft> aircraft = const [];
  Selection? selected;
  bool following = false;
  bool lastFetchFailed = false;
  DateTime? lastUpdate;

  LatLng _center = const LatLng(51.47, -0.45);
  double _radiusNm = 60;
  Timer? _timer;
  bool _inFlight = false;

  void start() {
    _timer ??= Timer.periodic(const Duration(seconds: 6), (_) => refresh());
    refresh();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void setViewport(LatLng center, double radiusNm) {
    _center = center;
    _radiusNm = radiusNm;
  }

  Future<void> refresh() async {
    if (_inFlight) return;
    _inFlight = true;
    try {
      final list = await api.aircraftAround(_center, _radiusNm);
      lastFetchFailed = list == null;
      if (list != null) {
        aircraft = list;
        lastUpdate = DateTime.now();
      }
      final sel = selected;
      if (sel != null) {
        final fresh = list?.where((a) => a.hex == sel.aircraft.hex).firstOrNil ??
            await api.byHex(sel.aircraft.hex);
        if (fresh != null && identical(selected, sel)) sel.aircraft = fresh;
      }
      notifyListeners();
    } finally {
      _inFlight = false;
    }
  }

  Future<void> select(Aircraft a, {bool follow = false}) async {
    final sel = Selection(aircraft: a);
    selected = sel;
    following = follow;
    notifyListeners();
    final results = await Future.wait([
      a.callsign == null ? Future<FlightRoute?>.value() : api.route(a.callsign!, a.position),
      api.track(a.hex),
    ]);
    if (!identical(selected, sel)) return;
    sel
      ..route = results[0] as FlightRoute?
      ..track = results[1] as FlightTrack?
      ..loadingDetails = false;
    notifyListeners();
  }

  void deselect() {
    selected = null;
    following = false;
    notifyListeners();
  }

  void setFollowing(bool v) {
    following = v;
    notifyListeners();
  }
}

extension FirstOrNullX<T> on Iterable<T> {
  T? get firstOrNil {
    final it = iterator;
    return it.moveNext() ? it.current : null;
  }
}
