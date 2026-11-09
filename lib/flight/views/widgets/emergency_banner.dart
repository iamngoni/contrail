//
//  Contrail
//  emergency_banner.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';

class EmergencyBanner extends StatelessWidget {
  const EmergencyBanner({required this.aircraft, super.key});

  final Aircraft aircraft;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String text = switch (aircraft.emergencyKind) {
      EmergencyKind.general => l10n.emergencyGeneral,
      EmergencyKind.radio => l10n.emergencyRadio,
      EmergencyKind.hijack => l10n.emergencyHijack,
      EmergencyKind.other => l10n.emergencyOther(aircraft.emergency ?? ''),
      null => '',
    };
    return Semantics(
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.red.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.red.withValues(alpha: 0.35),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s8 + AppSpacing.half),
          child: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: AppColors.red,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.s8),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
