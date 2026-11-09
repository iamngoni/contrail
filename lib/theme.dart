import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static const bg = Color(0xFF0B0D10);
  static const glass = Color(0xC7121418);
  static const surface = Color(0xFF15181D);
  static const hairline = Color(0x14FFFFFF);
  static const text = Color(0xFFECEEF1);
  static const muted = Color(0xFF7E848D);
  static const green = Color(0xFF3DD68C);
  static const amber = Color(0xFFE8B04A);
  static const red = Color(0xFFF87171);
  static const ground = Color(0xFF5A6270);

  /// Altitude colour scale shared by the map, the legend and the profile.
  static const altStops = [
    (0, Color(0xFF3BB6C9)),
    (3000, Color(0xFF3BB6C9)),
    (12000, Color(0xFF6E7BF2)),
    (28000, Color(0xFFC46BD6)),
    (40000, Color(0xFFE8B04A)),
  ];

  static Color altitude(int? ft, {bool onGround = false}) {
    if (onGround || ft == null || ft <= 0) return ground;
    for (var i = 1; i < altStops.length; i++) {
      final (a, ca) = altStops[i - 1];
      final (b, cb) = altStops[i];
      if (ft <= b) return Color.lerp(ca, cb, (ft - a) / (b - a))!;
    }
    return altStops.last.$2;
  }
}

TextStyle mono(double size, {FontWeight weight = FontWeight.w500, Color color = Palette.text}) =>
    GoogleFonts.jetBrainsMono(fontSize: size, fontWeight: weight, color: color, letterSpacing: -0.2);

ThemeData buildTheme() {
  final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: Palette.bg,
    colorScheme: base.colorScheme.copyWith(primary: Palette.text, surface: Palette.surface),
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: Palette.text,
      displayColor: Palette.text,
    ),
    splashFactory: NoSplash.splashFactory,
  );
}
