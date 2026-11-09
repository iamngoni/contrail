//
//  Contrail
//  flight_route_progress.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../models/data/airport.dart';
import '../../models/data/flight_route.dart';
import '../../models/data/flight_snapshot.dart';
import 'progress_track.dart';
import 'route_airport_label.dart';

/// Origin → destination with progress, time since departure and ETA.
class FlightRouteProgress extends StatelessWidget {
  const FlightRouteProgress({
    required this.snapshot,
    required this.loading,
    super.key,
  });

  final FlightSnapshot snapshot;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final FlightRoute? route = snapshot.route;
    if (route == null) {
      return Text(
        loading ? l10n.routeLoading : l10n.routeUnknown,
        style: AppTypography.subtitle,
      );
    }
    final DateTime? departed = snapshot.track?.departedAt;
    final Duration? eta = snapshot.eta;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteAirportLabel(airport: route.origin),
            if (route.stops.isNotEmpty)
              Text(
                l10n.routeVia(
                  route.stops.map((Airport a) => a.code).join(', '),
                ),
                style: AppTypography.label,
              ),
            RouteAirportLabel(airport: route.destination, alignEnd: true),
          ],
        ),
        const SizedBox(height: AppSpacing.s8 + AppSpacing.half),
        ProgressTrack(progress: snapshot.progress ?? 0),
        const SizedBox(height: AppSpacing.s8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              departed != null
                  ? l10n.departedAgo(
                      l10n.duration(
                        DateTime.now().toUtc().difference(departed),
                      ),
                    )
                  : l10n.kmFlown(l10n.number(snapshot.flownKm ?? 0)),
              style: AppTypography.label,
            ),
            Text(
              eta != null
                  ? l10n.landsIn(l10n.duration(eta))
                  : l10n.kmToGo(l10n.number(snapshot.remainingKm ?? 0)),
              style: AppTypography.label.copyWith(
                color: AppTypography.small.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
