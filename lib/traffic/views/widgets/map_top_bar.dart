//
//  Contrail
//  map_top_bar.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/views/widgets/glass_icon_button.dart';
import '../../../core/views/widgets/glass_panel.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Search field, "above you" and locate controls.
class MapTopBar extends StatelessWidget {
  const MapTopBar({
    required this.onSearch,
    required this.onNearby,
    required this.onLocate,
    super.key,
  });

  final VoidCallback onSearch;
  final VoidCallback onNearby;
  final VoidCallback onLocate;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Semantics(
            button: true,
            label: l10n.searchPlaceholder,
            child: GestureDetector(
              onTap: onSearch,
              child: GlassPanel(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s16 - 2,
                  vertical: AppSpacing.s16 - 3,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      size: 19,
                      color: AppColors.muted,
                    ),
                    const SizedBox(width: AppSpacing.s8),
                    Flexible(
                      child: Text(
                        l10n.searchPlaceholder,
                        style: AppTypography.bodyMuted,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s8),
        GlassIconButton(
          icon: Icons.radar_rounded,
          tooltip: l10n.aboveYouTooltip,
          onPressed: onNearby,
        ),
        const SizedBox(width: AppSpacing.s8),
        GlassIconButton(
          icon: Icons.near_me_rounded,
          tooltip: l10n.myLocation,
          onPressed: onLocate,
        ),
      ],
    );
  }
}
