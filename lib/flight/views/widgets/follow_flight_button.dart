//
//  Contrail
//  follow_flight_button.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_motion.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';

class FollowFlightButton extends StatelessWidget {
  const FollowFlightButton({
    required this.following,
    required this.onChanged,
    super.key,
  });

  final bool following;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Color color = following ? AppColors.amber : AppColors.text;
    return Semantics(
      button: true,
      toggled: following,
      child: GestureDetector(
        onTap: () => onChanged(!following),
        child: AnimatedContainer(
          duration: AppMotion.micro,
          height: AppSpacing.touchTarget - 2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: following
                ? AppColors.amber.withValues(alpha: 0.14)
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                following
                    ? Icons.gps_fixed_rounded
                    : Icons.gps_not_fixed_rounded,
                size: 17,
                color: color,
              ),
              const SizedBox(width: AppSpacing.s8),
              Text(
                following ? l10n.followingFlight : l10n.followFlight,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
