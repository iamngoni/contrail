import 'package:flutter/material.dart';

import '../data/models.dart';
import '../theme.dart';
import '../util/geo.dart';

/// Altitude against distance flown for the current leg.
class AltitudeProfile extends StatelessWidget {
  const AltitudeProfile({super.key, required this.track, this.remainingKm, this.height = 56});

  final FlightTrack track;
  final double? remainingKm;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(painter: _ProfilePainter(track, remainingKm)),
    );
  }
}

class _ProfilePainter extends CustomPainter {
  _ProfilePainter(this.track, this.remainingKm);

  final FlightTrack track;
  final double? remainingKm;

  @override
  void paint(Canvas canvas, Size size) {
    final pts = track.points;
    if (pts.length < 2) return;
    final cum = <double>[0];
    for (var i = 1; i < pts.length; i++) {
      cum.add(cum.last + distanceKm(pts[i - 1].position, pts[i].position));
    }
    final flown = cum.last;
    final total = flown + (remainingKm ?? 0);
    if (total <= 0) return;
    const maxAlt = 42000.0;
    double x(double km) => km / total * size.width;
    double y(int ft) => size.height - 2 - (ft.clamp(0, maxAlt) / maxAlt) * (size.height - 6);

    final line = Path()..moveTo(x(0), y(pts.first.altitudeFt));
    for (var i = 1; i < pts.length; i++) {
      line.lineTo(x(cum[i]), y(pts[i].altitudeFt));
    }
    final fill = Path.from(line)
      ..lineTo(x(flown), size.height)
      ..lineTo(0, size.height)
      ..close();

    final shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [for (final s in Palette.altStops) s.$2],
      stops: [for (final s in Palette.altStops) s.$1 / maxAlt],
    ).createShader(Offset.zero & size);

    canvas.saveLayer(Offset.zero & size, Paint()..color = Colors.white.withValues(alpha: 0.14));
    canvas.drawPath(fill, Paint()..shader = shader);
    canvas.restore();
    canvas.drawPath(
        line,
        Paint()
          ..shader = shader
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..strokeJoin = StrokeJoin.round);

    if (remainingKm != null && remainingKm! > 0) {
      final dash = Paint()
        ..color = Palette.muted.withValues(alpha: 0.6)
        ..strokeWidth = 1;
      final y0 = y(pts.last.altitudeFt);
      for (var px = x(flown) + 3; px < size.width; px += 7) {
        canvas.drawLine(Offset(px, y0), Offset((px + 3).clamp(0, size.width), y0), dash);
      }
    }
    canvas.drawCircle(Offset(x(flown), y(pts.last.altitudeFt)), 3, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_ProfilePainter old) => old.track != track || old.remainingKm != remainingKm;
}
