//
//  Contrail
//  plane_icon.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Top-down airliner silhouette, nose up, rotated to [headingDeg].
class PlaneIcon extends StatelessWidget {
  const PlaneIcon({
    required this.color,
    required this.size,
    this.headingDeg = 0,
    this.outlined = false,
    super.key,
  });

  final Color color;
  final double size;
  final double headingDeg;
  final bool outlined;

  @override
  Widget build(BuildContext context) => Transform.rotate(
    angle: headingDeg * math.pi / 180,
    child: CustomPaint(
      size: Size.square(size),
      painter: _PlanePainter(color: color, outlined: outlined),
    ),
  );
}

class _PlanePainter extends CustomPainter {
  _PlanePainter({required this.color, required this.outlined});

  final Color color;
  final bool outlined;

  /// Drawn in a 64x64 box.
  static final Path _path = Path()
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

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / 64;
    canvas.scale(scale);
    if (outlined) {
      canvas.drawPath(
        _path,
        Paint()
          ..color = Colors.black.withValues(alpha: 0.55)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2 / scale
          ..strokeJoin = StrokeJoin.round,
      );
    }
    canvas.drawPath(_path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_PlanePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.outlined != outlined;
}
