import 'package:flutter/material.dart';

import '../data/airlines.dart';
import '../data/tracker.dart';
import '../theme.dart';
import '../widgets/altitude_profile.dart';
import '../widgets/common.dart';

String _fmtInt(num v) {
  final s = v.round().abs().toString();
  final b = StringBuffer(v < 0 ? '−' : '');
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

String _fmtDur(Duration d) {
  final h = d.inHours, m = d.inMinutes % 60;
  if (h == 0) return '${m}m';
  return '${h}h ${m.toString().padLeft(2, '0')}m';
}

/// Bottom sheet for the selected aircraft: the quick answers up top, the rest
/// one swipe away.
class FlightSheet extends StatelessWidget {
  const FlightSheet({super.key, required this.sel, required this.following, required this.onFollow, required this.onClose});

  final Selection sel;
  final bool following;
  final ValueChanged<bool> onFollow;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.34,
      minChildSize: 0.2,
      maxChildSize: 0.86,
      snap: true,
      snapSizes: const [0.34, 0.86],
      builder: (context, scroll) => Glass(
        radius: 28,
        child: ListView(
          controller: scroll,
          padding: EdgeInsets.fromLTRB(20, 8, 20, MediaQuery.paddingOf(context).bottom + 20),
          children: [
            Center(
              child: Container(
                width: 36,
                height: 5,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(3)),
              ),
            ),
            _header(),
            if (sel.aircraft.emergencyText != null) ...[
              const SizedBox(height: 12),
              _emergency(sel.aircraft.emergencyText!),
            ],
            const SizedBox(height: 14),
            _route(),
            const Hairline(),
            _liveStats(),
            const Hairline(),
            _actions(),
            const Hairline(),
            if (sel.track != null && sel.track!.points.length > 1) ...[
              const Text('Altitude profile', style: TextStyle(fontSize: 11, color: Palette.muted)),
              const SizedBox(height: 8),
              AltitudeProfile(track: sel.track!, remainingKm: sel.remainingKm),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sel.route?.origin.code ?? 'Take-off', style: mono(10, color: Palette.muted)),
                  Text(sel.route?.destination.code ?? 'Now', style: mono(10, color: Palette.muted)),
                ],
              ),
              const Hairline(),
            ],
            _details(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final a = sel.aircraft;
    final cs = a.callsign;
    final airline = airlineName(cs);
    final phase = sel.phase;
    final phaseColor = switch (phase) {
      'Final approach' || 'Climbing' => Palette.green,
      'Descending' => Palette.amber,
      'On ground' => Palette.muted,
      _ => Palette.text,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cs != null ? flightNumber(cs) : (a.registration ?? a.hex.toUpperCase()),
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, letterSpacing: -0.4)),
              const SizedBox(height: 2),
              Text(
                [?airline, if (cs != null && flightNumber(cs) != cs) cs].join(' · '),
                style: const TextStyle(fontSize: 13, color: Palette.muted),
              ),
            ],
          ),
        ),
        Row(children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: phaseColor, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(phase, style: TextStyle(fontSize: 12.5, color: phaseColor)),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onClose,
            child: const Icon(Icons.close_rounded, size: 20, color: Palette.muted),
          ),
        ]),
      ],
    );
  }

  Widget _emergency(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Palette.red.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Palette.red.withValues(alpha: 0.35), width: 0.5),
        ),
        child: Row(children: [
          const Icon(Icons.warning_amber_rounded, color: Palette.red, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Palette.red, fontSize: 13, fontWeight: FontWeight.w500))),
        ]),
      );

  Widget _route() {
    final r = sel.route;
    if (r == null) {
      return Text(
        sel.loadingDetails ? 'Looking up route…' : 'Route not published for this flight',
        style: const TextStyle(fontSize: 13, color: Palette.muted),
      );
    }
    final p = sel.progress ?? 0;
    final eta = sel.eta;
    final dep = sel.track?.departedAt;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _airport(r.origin.code, r.origin.city, CrossAxisAlignment.start),
          if (r.airports.length > 2)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('via ${r.airports.sublist(1, r.airports.length - 1).map((a) => a.code).join(', ')}',
                  style: const TextStyle(fontSize: 11, color: Palette.muted)),
            ),
          _airport(r.destination.code, r.destination.city, CrossAxisAlignment.end),
        ],
      ),
      const SizedBox(height: 12),
      LayoutBuilder(builder: (context, c) {
        return SizedBox(
          height: 10,
          child: Stack(alignment: Alignment.centerLeft, children: [
            Container(height: 2, decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(1))),
            Container(
              height: 2,
              width: c.maxWidth * p,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: const LinearGradient(colors: [Color(0xFF6E7BF2), Palette.amber]),
              ),
            ),
            Positioned(
              left: (c.maxWidth * p - 4).clamp(0, c.maxWidth - 8),
              child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
            ),
          ]),
        );
      }),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dep != null ? 'Departed ${_fmtDur(DateTime.now().toUtc().difference(dep))} ago' : '${_fmtInt(distanceFlown())} km flown',
            style: const TextStyle(fontSize: 11.5, color: Palette.muted),
          ),
          Text(
            eta != null ? 'Lands in ~${_fmtDur(eta)}' : '${_fmtInt(sel.remainingKm ?? 0)} km to go',
            style: const TextStyle(fontSize: 11.5, color: Palette.text),
          ),
        ],
      ),
    ]);
  }

  double distanceFlown() => (sel.totalKm ?? 0) - (sel.remainingKm ?? 0);

  Widget _airport(String code, String city, CrossAxisAlignment align) => Column(
        crossAxisAlignment: align,
        children: [
          Text(code, style: mono(16)),
          const SizedBox(height: 2),
          Text(city, style: const TextStyle(fontSize: 11, color: Palette.muted)),
        ],
      );

  Widget _liveStats() {
    final a = sel.aircraft;
    final vr = a.verticalRateFpm;
    return Row(children: [
      Expanded(child: Stat(label: 'Altitude', value: a.onGround ? 'GND' : _fmtInt(a.altitudeFt ?? 0), unit: a.onGround ? null : 'ft')),
      Expanded(child: Stat(label: 'Speed', value: a.groundSpeedKt == null ? '–' : _fmtInt(a.groundSpeedKt!), unit: 'kt')),
      Expanded(
        child: Stat(
          label: 'Vertical',
          value: vr == null ? '–' : (vr > 0 ? '+${_fmtInt(vr)}' : _fmtInt(vr)),
          unit: 'fpm',
          valueColor: vr == null || vr.abs() < 200 ? null : (vr > 0 ? Palette.green : Palette.amber),
        ),
      ),
      Expanded(child: Stat(label: 'Heading', value: a.trackDeg == null ? '–' : '${a.trackDeg!.round()}°')),
    ]);
  }

  Widget _actions() {
    return Row(children: [
      Expanded(
        child: GestureDetector(
          onTap: () => onFollow(!following),
          child: Container(
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: following ? Palette.amber.withValues(alpha: 0.14) : Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(following ? Icons.gps_fixed_rounded : Icons.gps_not_fixed_rounded,
                  size: 17, color: following ? Palette.amber : Palette.text),
              const SizedBox(width: 8),
              Text(following ? 'Following' : 'Follow this flight',
                  style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color: following ? Palette.amber : Palette.text)),
            ]),
          ),
        ),
      ),
    ]);
  }

  Widget _details() {
    final a = sel.aircraft;
    final rows = <(String, String)>[
      if (a.type != null) ('Aircraft', a.description != null ? '${a.description} (${a.type})' : a.type!),
      if (a.registration != null) ('Registration', a.registration!),
      ('Mode S', a.hex.toUpperCase()),
      if (a.squawk != null) ('Squawk', a.squawk!),
      if (sel.totalKm != null) ('Route distance', '${_fmtInt(sel.totalKm!)} km'),
      if (sel.route != null) ('From', sel.route!.origin.name),
      if (sel.route != null) ('To', sel.route!.destination.name),
    ];
    return Column(
      children: [
        for (final r in rows)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(children: [
              SizedBox(width: 110, child: Text(r.$1, style: const TextStyle(fontSize: 12.5, color: Palette.muted))),
              Expanded(child: Text(r.$2, style: const TextStyle(fontSize: 13), textAlign: TextAlign.right)),
            ]),
          ),
        const SizedBox(height: 10),
        const Text('Positions: adsb.lol (ODbL) · Routes: adsb.lol route database, crowd-sourced',
            style: TextStyle(fontSize: 10, color: Palette.muted)),
      ],
    );
  }
}
