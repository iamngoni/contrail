//
//  Contrail
//  aircraft_list_tile.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../traffic/models/data/aircraft.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../configs/app_typography.dart';
import '../../utils/airlines.dart';
import 'plane_icon.dart';

/// A row for one aircraft: icon, flight, airline/type, and trailing facts.
class AircraftListTile extends StatelessWidget {
  const AircraftListTile({
    required this.aircraft,
    required this.trailingTop,
    required this.trailingBottom,
    required this.onTap,
    this.includeRegistration = false,
    super.key,
  });

  final Aircraft aircraft;
  final String trailingTop;
  final String? trailingBottom;
  final VoidCallback onTap;
  final bool includeRegistration;

  @override
  Widget build(BuildContext context) {
    final String? cs = aircraft.callsign;
    final String title = cs != null
        ? flightNumber(cs)
        : (aircraft.registration ?? aircraft.hex.toUpperCase());
    final String subtitle = [
      airlineName(cs),
      aircraft.type,
      if (includeRegistration) aircraft.registration,
    ].nonNulls.join(' · ');
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16 - 4),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: PlaneIcon(
                color: AppColors.altitude(
                  aircraft.altitudeFt,
                  onGround: aircraft.onGround,
                ),
                size: 22,
                headingDeg: aircraft.trackDeg ?? 0,
              ),
            ),
            const SizedBox(width: AppSpacing.s8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.mono(14)),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTypography.subtitle.copyWith(fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(trailingTop, style: AppTypography.mono(13)),
                if (trailingBottom != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    trailingBottom!,
                    style: AppTypography.mono(11.5, color: AppColors.muted),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
