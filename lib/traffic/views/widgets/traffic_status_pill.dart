//
//  Contrail
//  traffic_status_pill.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/views/widgets/glass_panel.dart';
import '../../../core/views/widgets/status_dot.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../models/data/traffic_status.dart';
import '../../state/traffic/traffic_bloc.dart';

/// How many aircraft are up, or why none are shown.
class TrafficStatusPill extends StatelessWidget {
  const TrafficStatusPill({required this.state, super.key});

  final TrafficState state;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool offline =
        state.status == TrafficStatus.failure && state.aircraft.isEmpty;
    final bool loading =
        state.aircraft.isEmpty &&
        (state.status == TrafficStatus.loading ||
            state.status == TrafficStatus.initial);
    final String text = offline
        ? l10n.trafficOffline
        : loading
        ? l10n.trafficLoading
        : l10n.airborneCount(state.airborneCount);
    final Color dot = state.status == TrafficStatus.failure
        ? AppColors.red
        : loading
        ? AppColors.muted
        : AppColors.green;
    return Semantics(
      liveRegion: true,
      child: GlassPanel(
        radius: 20,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s8 + 1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatusDot(color: dot),
            const SizedBox(width: AppSpacing.s8),
            Text(text, style: AppTypography.small),
          ],
        ),
      ),
    );
  }
}
