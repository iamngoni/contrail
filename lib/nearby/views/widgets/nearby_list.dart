//
//  Contrail
//  nearby_list.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/geo.dart';
import '../../../core/views/widgets/aircraft_list_tile.dart';
import '../../../core/views/widgets/hairline_divider.dart';
import '../../../core/views/widgets/message_view.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../models/data/nearby_aircraft.dart';
import '../../models/data/nearby_status.dart';
import '../../state/nearby/nearby_bloc.dart';

/// Aircraft around the person, with loading, empty and failure states.
class NearbyList extends StatelessWidget {
  const NearbyList({
    required this.state,
    required this.onPick,
    required this.onRefresh,
    super.key,
  });

  final NearbyState state;
  final ValueChanged<Aircraft> onPick;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    if (state.rows.isEmpty) {
      return switch (state.status) {
        NearbyStatus.loading => const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: AppColors.muted,
          ),
        ),
        NearbyStatus.failure => Center(
          child: MessageView(message: l10n.nearbyFailed, onRetry: onRefresh),
        ),
        NearbyStatus.loaded => Center(
          child: MessageView(message: l10n.nearbyEmpty(state.radiusKm)),
        ),
      };
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        itemCount: state.rows.length,
        separatorBuilder: (_, _) => const HairlineDivider(spacing: 0),
        itemBuilder: (BuildContext context, int i) {
          final NearbyAircraft row = state.rows[i];
          final int vr = row.aircraft.verticalRateFpm ?? 0;
          final String trend = vr > 300 ? ' ↑' : (vr < -300 ? ' ↓' : '');
          return AircraftListTile(
            aircraft: row.aircraft,
            trailingTop: l10n.nearbyDistance(
              row.distanceKm.toStringAsFixed(row.distanceKm < 10 ? 1 : 0),
              compassPoint(row.bearingDeg),
            ),
            trailingBottom:
                '${l10n.feet(l10n.number(row.aircraft.altitudeFt ?? 0))}'
                '$trend',
            onTap: () => onPick(row.aircraft),
          );
        },
      ),
    );
  }
}
