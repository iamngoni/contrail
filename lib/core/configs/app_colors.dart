//
//  Contrail
//  app_colors.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

/// The Contrail palette. Every colour on screen comes from here.
abstract final class AppColors {
  static const Color background = Color(0xFF0B0D10);
  static const Color mapBackground = Color(0xFF111214);
  static const Color glass = Color(0xC7121418);
  static const Color surface = Color(0xFF15181D);
  static const Color hairline = Color(0x14FFFFFF);
  static const Color handle = Color(0x2EFFFFFF);
  static const Color track = Color(0x1FFFFFFF);
  static const Color text = Color(0xFFECEEF1);
  static const Color control = Color(0xFFC9CDD3);
  static const Color muted = Color(0xFF7E848D);
  static const Color airport = Color(0xFF9AA1AB);
  static const Color green = Color(0xFF3DD68C);
  static const Color amber = Color(0xFFE8B04A);
  static const Color red = Color(0xFFF87171);
  static const Color ground = Color(0xFF5A6270);
  static const Color me = Color(0xFF4FA3FF);
  static const Color indigo = Color(0xFF6E7BF2);

  /// Altitude scale shared by the map, the legend and the profile.
  static const List<(int, Color)> altitudeStops = [
    (0, Color(0xFF3BB6C9)),
    (3000, Color(0xFF3BB6C9)),
    (12000, indigo),
    (28000, Color(0xFFC46BD6)),
    (40000, amber),
  ];

  static Color altitude(int? feet, {bool onGround = false}) {
    if (onGround || feet == null || feet <= 0) return ground;
    for (var i = 1; i < altitudeStops.length; i++) {
      final (int low, Color lowColor) = altitudeStops[i - 1];
      final (int high, Color highColor) = altitudeStops[i];
      if (feet <= high) {
        return Color.lerp(lowColor, highColor, (feet - low) / (high - low))!;
      }
    }
    return altitudeStops.last.$2;
  }
}
