//
//  Contrail
//  airport_marker.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_typography.dart';

class AirportMarker extends StatelessWidget {
  const AirportMarker({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox.square(
        dimension: 8,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.airport, width: 1.4),
          ),
        ),
      ),
      const SizedBox(height: 3),
      Text(
        code,
        style: AppTypography.mono(
          9.5,
          weight: FontWeight.w600,
          color: AppColors.airport,
        ),
      ),
    ],
  );
}
