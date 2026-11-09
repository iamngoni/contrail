//
//  Contrail
//  app_typography.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Type styles. Inter for words, JetBrains Mono for codes and numbers.
abstract final class AppTypography {
  static TextStyle mono(
    double size, {
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.text,
  }) => GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: -0.2,
  );

  static const TextStyle title = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14.5,
    color: AppColors.text,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 14.5,
    color: AppColors.muted,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    color: AppColors.muted,
  );

  static const TextStyle label = TextStyle(
    fontSize: 11,
    color: AppColors.muted,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    color: AppColors.muted,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12.5,
    color: AppColors.text,
  );
}
