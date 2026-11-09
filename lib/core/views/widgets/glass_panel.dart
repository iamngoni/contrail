//
//  Contrail
//  glass_panel.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

/// Frosted panel for everything that floats over the map.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    required this.child,
    this.radius = AppSpacing.radiusControl,
    this.padding,
    super.key,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.glass,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: AppColors.hairline, width: 0.5),
        ),
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    ),
  );
}
