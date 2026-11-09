//
//  Contrail
//  flight_phase_badge.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/views/widgets/status_dot.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../models/data/flight_phase.dart';

class FlightPhaseBadge extends StatelessWidget {
  const FlightPhaseBadge({required this.phase, super.key});

  final FlightPhase phase;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final (String label, Color color) = switch (phase) {
      FlightPhase.onGround => (l10n.phaseOnGround, AppColors.muted),
      FlightPhase.finalApproach => (l10n.phaseFinalApproach, AppColors.green),
      FlightPhase.climbing => (l10n.phaseClimbing, AppColors.green),
      FlightPhase.descending => (l10n.phaseDescending, AppColors.amber),
      FlightPhase.cruising => (l10n.phaseCruising, AppColors.text),
      FlightPhase.level => (l10n.phaseLevel, AppColors.text),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StatusDot(color: color),
        const SizedBox(width: AppSpacing.s8),
        Text(label, style: TextStyle(fontSize: 12.5, color: color)),
      ],
    );
  }
}
