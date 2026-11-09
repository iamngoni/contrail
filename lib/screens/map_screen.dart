import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../data/adsb_api.dart';
import '../data/models.dart';
import '../data/tracker.dart';
import '../theme.dart';
import '../util/geo.dart';
import '../widgets/common.dart';
import '../widgets/plane_icon.dart';
import 'flight_sheet.dart';
import 'nearby_screen.dart';
import 'search_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _api = AdsbApi();
  late final Tracker _tracker = Tracker(_api);
  final _map = MapController();
  Timer? _debounce;
  LatLng? _me;

  @override
  void initState() {
    super.initState();
    _tracker.addListener(_onTracker);
    _tracker.start();
    _locate(initial: true);
  }

  @override
  void dispose() {
    _tracker.removeListener(_onTracker);
    _tracker.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onTracker() {
    final sel = _tracker.selected;
    if (_tracker.following && sel != null) {
      _map.move(sel.aircraft.position, _map.camera.zoom);
    }
    if (mounted) setState(() {});
  }

  Future<LatLng?> _currentPosition() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return null;
      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) perm = await Geolocator.requestPermission();
      if (perm == LocationPermission.denied || perm == LocationPermission.deniedForever) return null;
      final p = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium),
      ).timeout(const Duration(seconds: 10));
      return LatLng(p.latitude, p.longitude);
    } catch (_) {
      return null;
    }
  }

  Future<void> _locate({bool initial = false}) async {
    final me = await _currentPosition();
    if (!mounted) return;
    if (me == null) {
      if (!initial) _toast('Location is off for Contrail');
      return;
    }
    setState(() => _me = me);
    _tracker.setFollowing(false);
    _map.move(me, initial ? 8.5 : _map.camera.zoom.clamp(8, 11));
    _viewportChanged(_map.camera, immediate: true);
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Palette.surface,
    ));
  }

  void _viewportChanged(MapCamera camera, {bool immediate = false}) {
    final b = camera.visibleBounds;
    final radiusKm = distanceKm(camera.center, b.northEast);
    _tracker.setViewport(camera.center, radiusKm / kmPerNm);
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: immediate ? 0 : 700), _tracker.refresh);
  }

  Future<void> _select(Aircraft a, {bool fly = false}) async {
    if (fly) {
      _map.move(a.position, _map.camera.zoom < 7 ? 8 : _map.camera.zoom);
      _viewportChanged(_map.camera, immediate: true);
    }
    await _tracker.select(a);
  }

  Future<void> _openSearch() async {
    final a = await Navigator.of(context).push<Aircraft>(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, _, _) => SearchScreen(api: _api, around: _tracker.aircraft),
        transitionsBuilder: (_, anim, _, child) => FadeTransition(opacity: anim, child: child),
      ),
    );
    if (a != null) _select(a, fly: true);
  }

  Future<void> _openNearby() async {
    final me = _me ?? await _currentPosition();
    if (!mounted) return;
    if (me == null) {
      _toast('Turn on location to see what is above you');
      return;
    }
    setState(() => _me = me);
    final a = await Navigator.of(context).push<Aircraft>(
      MaterialPageRoute(builder: (_) => NearbyScreen(api: _api, me: me)),
    );
    if (a != null) _select(a, fly: true);
  }

  // ---------------------------------------------------------------- layers

  List<Polyline> _trackLines(Selection sel) {
    final path = sel.flownPath;
    final lines = <Polyline>[];
    if (path.length >= 2) {
      // Colour each stretch by the altitude flown there.
      final alts = <int>[...?sel.track?.points.map((p) => p.altitudeFt), sel.aircraft.altitudeFt ?? 0];
      final cum = <double>[0];
      for (var i = 1; i < path.length; i++) {
        cum.add(cum.last + distanceKm(path[i - 1], path[i]));
      }
      final total = cum.last <= 0 ? 1.0 : cum.last;
      final colors = <Color>[], stops = <double>[];
      final step = (path.length / 80).ceil().clamp(1, 1000);
      for (var i = 0; i < path.length; i += step) {
        final altIdx = ((i / (path.length - 1)) * (alts.length - 1)).round();
        colors.add(Palette.altitude(alts[altIdx]));
        stops.add(cum[i] / total);
      }
      colors.add(Palette.altitude(sel.aircraft.altitudeFt, onGround: sel.aircraft.onGround));
      stops.add(1);
      for (final seg in splitAntimeridian(path)) {
        if (seg.length < 2) continue;
        final full = seg.length == path.length;
        lines.add(Polyline(
          points: seg,
          strokeWidth: 9,
          color: Colors.white.withValues(alpha: 0.05),
          strokeCap: StrokeCap.round,
        ));
        lines.add(Polyline(
          points: seg,
          strokeWidth: 2.6,
          color: Palette.altitude(sel.aircraft.altitudeFt),
          gradientColors: full ? colors : null,
          colorsStop: full ? stops : null,
          strokeCap: StrokeCap.round,
          strokeJoin: StrokeJoin.round,
        ));
      }
    }
    final dest = sel.route?.destination.position;
    if (dest != null && !sel.aircraft.onGround) {
      final ahead = [sel.aircraft.position, ...greatCircle(sel.aircraft.position, dest), dest];
      for (final seg in splitAntimeridian(ahead)) {
        lines.add(Polyline(
          points: seg,
          strokeWidth: 1.6,
          color: Colors.white.withValues(alpha: 0.45),
          pattern: StrokePattern.dashed(segments: const [2, 7]),
        ));
      }
    }
    return lines;
  }

  List<Marker> _aircraftMarkers() {
    final selHex = _tracker.selected?.aircraft.hex;
    final dim = selHex != null;
    final markers = <Marker>[];
    for (final a in _tracker.aircraft) {
      if (a.hex == selHex) continue;
      if (a.onGround) {
        markers.add(Marker(
          point: a.position,
          width: 18,
          height: 18,
          child: GestureDetector(
            onTap: () => _select(a),
            child: Center(child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: Palette.ground, shape: BoxShape.circle))),
          ),
        ));
        continue;
      }
      markers.add(Marker(
        point: a.position,
        width: 30,
        height: 30,
        child: GestureDetector(
          onTap: () => _select(a),
          child: Center(
            child: Opacity(
              opacity: dim ? 0.4 : 0.92,
              child: PlaneIcon(
                color: a.isEmergency ? Palette.red : Palette.altitude(a.altitudeFt),
                size: 19,
                headingDeg: a.trackDeg ?? 0,
              ),
            ),
          ),
        ),
      ));
    }
    final sel = _tracker.selected;
    if (sel != null) {
      for (final ap in sel.route?.airports ?? const <Airport>[]) {
        markers.add(Marker(
          point: ap.position,
          width: 60,
          height: 34,
          alignment: Alignment.center,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Palette.bg,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF9AA1AB), width: 1.4),
              ),
            ),
            const SizedBox(height: 3),
            Text(ap.code, style: mono(9.5, weight: FontWeight.w600, color: const Color(0xFF9AA1AB))),
          ]),
        ));
      }
      markers.add(Marker(
        point: sel.aircraft.position,
        width: 64,
        height: 64,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.07),
              border: Border.all(color: Colors.white.withValues(alpha: 0.25), width: 1),
            ),
          ),
          PlaneIcon(color: Colors.white, size: 34, headingDeg: sel.aircraft.trackDeg ?? 0, outline: true),
        ]),
      ));
    }
    if (_me != null) {
      markers.add(Marker(
        point: _me!,
        width: 22,
        height: 22,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4FA3FF),
            border: Border.all(color: Colors.white, width: 2.5),
            boxShadow: const [BoxShadow(color: Color(0x664FA3FF), blurRadius: 10, spreadRadius: 4)],
          ),
        ),
      ));
    }
    return markers;
  }

  // ---------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    final sel = _tracker.selected;
    final top = MediaQuery.paddingOf(context).top;
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          mapController: _map,
          options: MapOptions(
            initialCenter: const LatLng(51.47, -0.45),
            initialZoom: 8.5,
            minZoom: 2,
            maxZoom: 15,
            backgroundColor: const Color(0xFF111214),
            interactionOptions: const InteractionOptions(flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
            onTap: (_, _) => _tracker.deselect(),
            onPositionChanged: (camera, hasGesture) {
              if (hasGesture) {
                if (_tracker.following) _tracker.setFollowing(false);
                _viewportChanged(camera);
              }
            },
            onMapReady: () => _viewportChanged(_map.camera, immediate: true),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}',
              userAgentPackageName: 'com.iamngoni.contrail',
              maxNativeZoom: 16,
              retinaMode: RetinaMode.isHighDensity(context),
              tileBuilder: (context, tile, _) => ColorFiltered(
                colorFilter: const ColorFilter.matrix([
                  0.82, 0, 0, 0, -6, //
                  0, 0.82, 0, 0, -6, //
                  0, 0, 0.86, 0, -4, //
                  0, 0, 0, 1, 0,
                ]),
                child: tile,
              ),
            ),
            if (sel != null) PolylineLayer(polylines: _trackLines(sel)),
            MarkerLayer(markers: _aircraftMarkers()),
          ],
        ),
        // Top controls
        Positioned(
          top: top + 8,
          left: 14,
          right: 14,
          child: Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: _openSearch,
                child: Glass(
                  radius: 14,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  child: const Row(children: [
                    Icon(Icons.search_rounded, size: 19, color: Palette.muted),
                    SizedBox(width: 8),
                    Text('Search flights, registrations', style: TextStyle(fontSize: 14.5, color: Palette.muted)),
                  ]),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GlassButton(icon: Icons.radar_rounded, onTap: _openNearby),
            const SizedBox(width: 8),
            GlassButton(icon: Icons.near_me_rounded, onTap: () => _locate()),
          ]),
        ),
        // Altitude legend
        Positioned(
          right: 14,
          top: top + 70,
          child: Glass(
            radius: 12,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            child: Column(children: [
              const Text('40k', style: TextStyle(fontSize: 9, color: Palette.muted)),
              const SizedBox(height: 4),
              Container(
                width: 3,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [for (final s in Palette.altStops) s.$2],
                    stops: [for (final s in Palette.altStops) s.$1 / 40000],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text('0 ft', style: TextStyle(fontSize: 9, color: Palette.muted)),
            ]),
          ),
        ),
        // Status pill when nothing is selected
        if (sel == null)
          Positioned(
            left: 14,
            right: 14,
            bottom: MediaQuery.paddingOf(context).bottom + 12,
            child: Center(
              child: Glass(
                radius: 20,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _tracker.lastFetchFailed ? Palette.red : Palette.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _tracker.lastFetchFailed && _tracker.aircraft.isEmpty
                        ? 'No connection to the ADS-B network'
                        : '${_tracker.aircraft.where((a) => !a.onGround).length} aircraft in the air here',
                    style: const TextStyle(fontSize: 12.5),
                  ),
                ]),
              ),
            ),
          ),
        if (sel != null)
          FlightSheet(
            key: ValueKey(sel.aircraft.hex),
            sel: sel,
            following: _tracker.following,
            onFollow: (v) {
              _tracker.setFollowing(v);
              if (v) _map.move(sel.aircraft.position, _map.camera.zoom);
            },
            onClose: _tracker.deselect,
          ),
      ]),
    );
  }
}
