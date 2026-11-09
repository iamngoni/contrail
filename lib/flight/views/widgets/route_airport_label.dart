//
//  Contrail
//  route_airport_label.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../models/data/airport.dart';

class RouteAirportLabel extends StatelessWidget {
  const RouteAirportLabel({
    required this.airport,
    this.alignEnd = false,
    super.key,
  });

  final Airport airport;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: alignEnd
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start,
    children: [
      Text(airport.code, style: AppTypography.mono(16)),
      const SizedBox(height: AppSpacing.half / 2),
      Text(airport.city, style: AppTypography.label),
    ],
  );
}
