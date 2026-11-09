//
//  Contrail
//  altitude_profile.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/utils/geo.dart';
import '../../models/data/flight_track.dart';
import '../../models/data/trace_point.dart';

/// Altitude against distance for the current leg; dashed ahead to landing.
class AltitudeProfile extends StatelessWidget {
  const AltitudeProfile({
    required this.track,
    this.remainingKm,
    this.height = 56,
    super.key,
  });

  final FlightTrack track;
  final double? remainingKm;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    width: double.infinity,
    child: CustomPaint(
      painter: _ProfilePainter(track: track, remainingKm: remainingKm),
    ),
  );
}

class _ProfilePainter extends CustomPainter {
  _ProfilePainter({required this.track, required this.remainingKm});

  final FlightTrack track;
  final double? remainingKm;

  static const double _maxAltitude = 42000;

  @override
  void paint(Canvas canvas, Size size) {
    final List<TracePoint> pts = track.points;
    if (pts.length < 2) return;
    final List<double> cum = [0];
    for (var i = 1; i < pts.length; i++) {
      cum.add(cum.last + distanceKm(pts[i - 1].position, pts[i].position));
    }
    final double flown = cum.last;
    final double total = flown + (remainingKm ?? 0);
    if (total <= 0) return;
    double x(double km) => km / total * size.width;
    double y(int ft) =>
        size.height -
        2 -
        (ft.clamp(0, _maxAltitude) / _maxAltitude) * (size.height - 6);

    final Path line = Path()..moveTo(x(0), y(pts.first.altitudeFt));
    for (var i = 1; i < pts.length; i++) {
      line.lineTo(x(cum[i]), y(pts[i].altitudeFt));
    }
    final Path fill = Path.from(line)
      ..lineTo(x(flown), size.height)
      ..lineTo(0, size.height)
      ..close();
    final Shader shader = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [for (final (_, Color c) in AppColors.altitudeStops) c],
      stops: [
        for (final (int ft, _) in AppColors.altitudeStops) ft / _maxAltitude,
      ],
    ).createShader(Offset.zero & size);

    canvas
      ..saveLayer(
        Offset.zero & size,
        Paint()..color = Colors.white.withValues(alpha: 0.14),
      )
      ..drawPath(fill, Paint()..shader = shader)
      ..restore()
      ..drawPath(
        line,
        Paint()
          ..shader = shader
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..strokeJoin = StrokeJoin.round,
      );

    final double? ahead = remainingKm;
    final double y0 = y(pts.last.altitudeFt);
    if (ahead != null && ahead > 0) {
      final Paint dash = Paint()
        ..color = AppColors.muted.withValues(alpha: 0.6)
        ..strokeWidth = 1;
      for (double px = x(flown) + 3; px < size.width; px += 7) {
        canvas.drawLine(
          Offset(px, y0),
          Offset((px + 3).clamp(0, size.width), y0),
          dash,
        );
      }
    }
    canvas.drawCircle(Offset(x(flown), y0), 3, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_ProfilePainter oldDelegate) =>
      oldDelegate.track != track || oldDelegate.remainingKm != remainingKm;
}
