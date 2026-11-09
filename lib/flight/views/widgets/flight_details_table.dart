//
//  Contrail
//  flight_details_table.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../models/data/flight_route.dart';
import '../../models/data/flight_snapshot.dart';
import 'detail_row.dart';

/// Aircraft, registration, codes and route facts.
class FlightDetailsTable extends StatelessWidget {
  const FlightDetailsTable({required this.snapshot, super.key});

  final FlightSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Aircraft a = snapshot.aircraft;
    final FlightRoute? route = snapshot.route;
    final double? total = snapshot.totalKm;
    final String? type = a.type;
    final String? description = a.description;
    final String? registration = a.registration;
    final String? squawk = a.squawk;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (type != null)
          DetailRow(
            label: l10n.detailAircraft,
            value: description != null ? '$description ($type)' : type,
          ),
        if (registration != null)
          DetailRow(label: l10n.detailRegistration, value: registration),
        DetailRow(label: l10n.detailModeS, value: a.hex.toUpperCase()),
        if (squawk != null) DetailRow(label: l10n.detailSquawk, value: squawk),
        if (total != null)
          DetailRow(
            label: l10n.detailRouteDistance,
            value: l10n.distanceKm(l10n.number(total)),
          ),
        if (route != null) ...[
          DetailRow(label: l10n.detailFrom, value: route.origin.name),
          DetailRow(label: l10n.detailTo, value: route.destination.name),
        ],
        const SizedBox(height: AppSpacing.s16),
        Text(l10n.dataAttribution, style: AppTypography.caption),
      ],
    );
  }
}
