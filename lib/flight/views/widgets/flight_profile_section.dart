//
//  Contrail
//  flight_profile_section.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../models/data/flight_snapshot.dart';
import '../../models/data/flight_track.dart';
import 'altitude_profile.dart';

class FlightProfileSection extends StatelessWidget {
  const FlightProfileSection({
    required this.snapshot,
    required this.track,
    super.key,
  });

  final FlightSnapshot snapshot;
  final FlightTrack track;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final TextStyle end = AppTypography.mono(
      10,
      color: AppTypography.caption.color!,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.altitudeProfile, style: AppTypography.label),
        const SizedBox(height: AppSpacing.s8),
        AltitudeProfile(track: track, remainingKm: snapshot.remainingKm),
        const SizedBox(height: AppSpacing.half),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              snapshot.route?.origin.code ?? l10n.profileTakeOff,
              style: end,
            ),
            Text(
              snapshot.route?.destination.code ?? l10n.profileNow,
              style: end,
            ),
          ],
        ),
      ],
    );
  }
}
