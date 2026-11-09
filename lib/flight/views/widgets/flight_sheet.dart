//
//  Contrail
//  flight_sheet.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/views/widgets/glass_panel.dart';
import '../../../core/views/widgets/hairline_divider.dart';
import '../../../core/views/widgets/sheet_handle.dart';
import '../../models/data/flight_snapshot.dart';
import '../../models/data/flight_track.dart';
import '../../state/flight/flight_bloc.dart';
import 'emergency_banner.dart';
import 'flight_details_table.dart';
import 'flight_header.dart';
import 'flight_live_stats.dart';
import 'flight_profile_section.dart';
import 'flight_route_progress.dart';
import 'follow_flight_button.dart';

/// The selected flight: quick answers first, everything else a swipe away.
class FlightSheet extends StatelessWidget {
  const FlightSheet({required this.state, super.key});

  final FlightState state;

  static const double collapsed = 0.34;
  static const double expanded = 0.86;

  @override
  Widget build(BuildContext context) {
    final FlightSnapshot? snapshot = state.snapshot;
    if (snapshot == null) return const SizedBox.shrink();
    final FlightTrack? track = snapshot.track;
    final FlightBloc bloc = context.read<FlightBloc>();
    return DraggableScrollableSheet(
      initialChildSize: collapsed,
      minChildSize: 0.2,
      maxChildSize: expanded,
      snap: true,
      snapSizes: const [collapsed, expanded],
      builder: (BuildContext context, ScrollController scroll) => GlassPanel(
        radius: AppSpacing.radiusSheet,
        child: ListView(
          controller: scroll,
          padding: EdgeInsets.fromLTRB(
            AppSpacing.s24 - AppSpacing.half,
            AppSpacing.s8,
            AppSpacing.s24 - AppSpacing.half,
            MediaQuery.paddingOf(context).bottom + AppSpacing.s24,
          ),
          children: [
            const SheetHandle(),
            FlightHeader(
              snapshot: snapshot,
              onClose: () => bloc.add(const FlightEvent.cleared()),
            ),
            if (snapshot.aircraft.isEmergency) ...[
              const SizedBox(height: AppSpacing.s16),
              EmergencyBanner(aircraft: snapshot.aircraft),
            ],
            const SizedBox(height: AppSpacing.s16),
            FlightRouteProgress(
              snapshot: snapshot,
              loading: state.loadingDetails,
            ),
            const HairlineDivider(),
            FlightLiveStats(aircraft: snapshot.aircraft),
            const HairlineDivider(),
            FollowFlightButton(
              following: state.following,
              onChanged: (bool v) =>
                  bloc.add(FlightEvent.followToggled(following: v)),
            ),
            const HairlineDivider(),
            if (track != null && track.points.length > 1) ...[
              FlightProfileSection(snapshot: snapshot, track: track),
              const HairlineDivider(),
            ],
            FlightDetailsTable(snapshot: snapshot),
          ],
        ),
      ),
    );
  }
}
