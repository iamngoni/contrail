//
//  Contrail
//  altitude_legend.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../configs/app_typography.dart';
import 'glass_panel.dart';

/// The altitude colour key shown beside the map.
class AltitudeLegend extends StatelessWidget {
  const AltitudeLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return GlassPanel(
      radius: 12,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s8,
        vertical: AppSpacing.s8,
      ),
      child: Column(
        children: [
          Text(l10n.legendTop, style: AppTypography.caption),
          const SizedBox(height: AppSpacing.half),
          SizedBox(
            width: 3,
            height: 90,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    for (final (_, Color c) in AppColors.altitudeStops) c,
                  ],
                  stops: [
                    for (final (int ft, _) in AppColors.altitudeStops)
                      ft / 40000,
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.half),
          Text(l10n.legendBottom, style: AppTypography.caption),
        ],
      ),
    );
  }
}
