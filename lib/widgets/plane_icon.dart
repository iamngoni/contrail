import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Top-down airliner silhouette, nose up, drawn in a 64x64 box.
class PlaneIcon extends StatelessWidget {
  const PlaneIcon({
    super.key,
    required this.color,
    required this.size,
    this.headingDeg = 0,
    this.outline = false,
  });

  final Color color;
  final double size;
  final double headingDeg;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: headingDeg * math.pi / 180,
      child: CustomPaint(size: Size.square(size), painter: _PlanePainter(color, outline)),
    );
  }
}

class _PlanePainter extends CustomPainter {
  _PlanePainter(this.color, this.outline);

  final Color color;
  final bool outline;

  static final Path _path = () {
    final p = Path()
      ..moveTo(32, 3)
      ..cubicTo(33.6, 3, 34.6, 5.4, 34.6, 8.6)
      ..lineTo(34.6, 22.8)
      ..lineTo(58.6, 36.2)
      ..lineTo(58.6, 39.8)
      ..lineTo(34.6, 32.6)
      ..lineTo(34.6, 45.2)
      ..lineTo(41.2, 50.2)
      ..lineTo(41.2, 53.4)
      ..lineTo(32, 51.6)
      ..lineTo(22.8, 53.4)
      ..lineTo(22.8, 50.2)
      ..lineTo(29.4, 45.2)
      ..lineTo(29.4, 32.6)
      ..lineTo(5.4, 39.8)
      ..lineTo(5.4, 36.2)
      ..lineTo(29.4, 22.8)
      ..lineTo(29.4, 8.6)
      ..cubicTo(29.4, 5.4, 30.4, 3, 32, 3)
      ..close();
    return p;
  }();

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 64;
    canvas.scale(s);
    if (outline) {
      canvas.drawPath(
        _path,
        Paint()
          ..color = Colors.black.withValues(alpha: 0.55)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4 / s * 0.5
          ..strokeJoin = StrokeJoin.round,
      );
    }
    canvas.drawPath(_path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_PlanePainter old) => old.color != color || old.outline != outline;
}
