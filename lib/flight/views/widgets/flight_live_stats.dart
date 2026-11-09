//
//  Contrail
//  flight_live_stats.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/views/widgets/stat_value.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';

/// Altitude, speed, vertical rate and heading, live.
class FlightLiveStats extends StatelessWidget {
  const FlightLiveStats({required this.aircraft, super.key});

  final Aircraft aircraft;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final int? vr = aircraft.verticalRateFpm;
    final double? gs = aircraft.groundSpeedKt;
    final double? heading = aircraft.trackDeg;
    return Row(
      children: [
        Expanded(
          child: StatValue(
            label: l10n.statAltitude,
            value: aircraft.onGround
                ? l10n.groundShort
                : l10n.number(aircraft.altitudeFt ?? 0),
            unit: aircraft.onGround ? null : l10n.unitFeet,
          ),
        ),
        Expanded(
          child: StatValue(
            label: l10n.statSpeed,
            value: gs == null ? '–' : l10n.number(gs),
            unit: l10n.unitKnots,
          ),
        ),
        Expanded(
          child: StatValue(
            label: l10n.statVertical,
            value: vr == null ? '–' : l10n.signedNumber(vr),
            unit: l10n.unitFeetPerMinute,
            valueColor: vr == null || vr.abs() < 200
                ? null
                : (vr > 0 ? AppColors.green : AppColors.amber),
          ),
        ),
        Expanded(
          child: StatValue(
            label: l10n.statHeading,
            value: heading == null ? '–' : '${heading.round()}°',
          ),
        ),
      ],
    );
  }
}
