//
//  Contrail
//  flight_header.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/utils/airlines.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../models/data/flight_snapshot.dart';
import 'flight_phase_badge.dart';

/// Flight number, airline and phase, with a close control.
class FlightHeader extends StatelessWidget {
  const FlightHeader({
    required this.snapshot,
    required this.onClose,
    super.key,
  });

  final FlightSnapshot snapshot;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final String? cs = snapshot.aircraft.callsign;
    final String? airline = airlineName(cs);
    final String title = cs != null
        ? flightNumber(cs)
        : (snapshot.aircraft.registration ??
              snapshot.aircraft.hex.toUpperCase());
    final String subtitle = [
      ?airline,
      if (cs != null && flightNumber(cs) != cs) cs,
    ].join(' · ');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.title),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.half),
                Text(subtitle, style: AppTypography.subtitle),
              ],
            ],
          ),
        ),
        FlightPhaseBadge(phase: snapshot.phase),
        const SizedBox(width: AppSpacing.s8),
        IconButton(
          onPressed: onClose,
          tooltip: AppLocalizations.of(context).close,
          visualDensity: VisualDensity.compact,
          icon: const Icon(
            Icons.close_rounded,
            size: 20,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}
