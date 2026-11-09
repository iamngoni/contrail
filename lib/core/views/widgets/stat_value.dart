//
//  Contrail
//  stat_value.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../configs/app_spacing.dart';
import '../../configs/app_typography.dart';

/// Label over a monospaced value, with an optional unit.
class StatValue extends StatelessWidget {
  const StatValue({
    required this.label,
    required this.value,
    this.unit,
    this.valueColor,
    super.key,
  });

  final String label;
  final String value;
  final String? unit;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTypography.label),
      const SizedBox(height: AppSpacing.half),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: value,
              style: valueColor == null
                  ? AppTypography.mono(16.5)
                  : AppTypography.mono(16.5, color: valueColor!),
            ),
            if (unit != null)
              TextSpan(text: ' $unit', style: AppTypography.label),
          ],
        ),
      ),
    ],
  );
}
