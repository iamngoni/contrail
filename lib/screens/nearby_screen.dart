import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../data/adsb_api.dart';
import '../data/airlines.dart';
import '../data/models.dart';
import '../theme.dart';
import '../util/geo.dart';
import '../widgets/common.dart';
import '../widgets/plane_icon.dart';

/// Aircraft in the sky around the person, closest first.
class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key, required this.api, required this.me});

  final AdsbApi api;
  final LatLng me;

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  static const _radiiKm = [25, 50, 100];
  int _radiusKm = 50;
  List<(Aircraft, double, double)>? _rows;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _rows = null);
    final list = await widget.api.aircraftAround(widget.me, _radiusKm / kmPerNm) ?? const <Aircraft>[];
    final rows = <(Aircraft, double, double)>[];
    for (final a in list) {
      if (a.onGround) continue;
      final d = distanceKm(widget.me, a.position);
      if (d > _radiusKm) continue;
      rows.add((a, d, bearingDeg(widget.me, a.position)));
    }
    rows.sort((x, y) => x.$2.compareTo(y.$2));
    if (mounted) setState(() => _rows = rows);
  }

  @override
  Widget build(BuildContext context) {
    final rows = _rows;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.bg,
        surfaceTintColor: Colors.transparent,
        title: const Text('Above you', style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [IconButton(onPressed: _load, icon: const Icon(Icons.refresh_rounded))],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Row(children: [
            for (final r in _radiiKm)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text('$r km'),
                  selected: _radiusKm == r,
                  showCheckmark: false,
                  onSelected: (_) {
                    _radiusKm = r;
                    _load();
                  },
                ),
              ),
            const Spacer(),
            if (rows != null) Text('${rows.length} aircraft', style: const TextStyle(color: Palette.muted, fontSize: 12.5)),
          ]),
        ),
        Expanded(
          child: rows == null
              ? const Center(child: CircularProgressIndicator(strokeWidth: 1.5, color: Palette.muted))
              : rows.isEmpty
                  ? const Center(child: Text('Clear skies: nothing airborne nearby.', style: TextStyle(color: Palette.muted)))
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: rows.length,
                        separatorBuilder: (_, _) => const Hairline(vertical: 0),
                        itemBuilder: (_, i) => _row(rows[i]),
                      ),
                    ),
        ),
      ]),
    );
  }

  Widget _row((Aircraft, double, double) r) {
    final (a, d, brg) = r;
    final cs = a.callsign;
    final vr = a.verticalRateFpm ?? 0;
    return InkWell(
      onTap: () => Navigator.pop(context, a),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(children: [
          SizedBox(width: 30, child: PlaneIcon(color: Palette.altitude(a.altitudeFt), size: 22, headingDeg: a.trackDeg ?? 0)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(cs != null ? flightNumber(cs) : (a.registration ?? a.hex.toUpperCase()), style: mono(14)),
              const SizedBox(height: 2),
              Text([airlineName(cs), a.type].whereType<String>().join(' · '),
                  style: const TextStyle(fontSize: 12, color: Palette.muted)),
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('${d.toStringAsFixed(d < 10 ? 1 : 0)} km ${compass(brg)}', style: mono(13)),
            const SizedBox(height: 2),
            Text('${a.altitudeFt ?? 0} ft ${vr > 300 ? '↑' : vr < -300 ? '↓' : ''}', style: mono(11.5, color: Palette.muted)),
          ]),
        ]),
      ),
    );
  }
}
