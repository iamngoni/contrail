//
//  Contrail
//  ground_aircraft_marker.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/views/widgets/status_dot.dart';

/// Parked or taxiing aircraft: a quiet dot.
class GroundAircraftMarker extends StatelessWidget {
  const GroundAircraftMarker({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: const Center(child: StatusDot(color: AppColors.ground, size: 4)),
  );
}
