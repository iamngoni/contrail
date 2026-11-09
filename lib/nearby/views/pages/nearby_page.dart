//
//  Contrail
//  nearby_page.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../injection.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../models/data/nearby_status.dart';
import '../../state/nearby/nearby_bloc.dart';
import '../widgets/nearby_list.dart';
import '../widgets/radius_selector.dart';

/// What is flying above the person; pops with the chosen [Aircraft].
class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  static Route<Aircraft> route({required LatLng me}) =>
      MaterialPageRoute<Aircraft>(
        builder: (_) => BlocProvider<NearbyBloc>(
          create: (_) => getIt<NearbyBloc>()..add(NearbyEvent.started(me: me)),
          child: const NearbyPage(),
        ),
      );

  Future<void> refresh(NearbyBloc bloc) async {
    bloc.add(const NearbyEvent.refreshRequested());
    await bloc.stream.firstWhere(
      (NearbyState s) => s.status != NearbyStatus.loading,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final NearbyBloc bloc = context.read<NearbyBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.nearbyTitle,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            tooltip: l10n.refresh,
            onPressed: () => unawaited(refresh(bloc)),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: BlocBuilder<NearbyBloc, NearbyState>(
        builder: (BuildContext context, NearbyState state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.s16,
                AppSpacing.half,
                AppSpacing.s16,
                AppSpacing.s8,
              ),
              child: Row(
                children: [
                  RadiusSelector(
                    options: NearbyBloc.radiiKm,
                    selected: state.radiusKm,
                    onChanged: (int km) =>
                        bloc.add(NearbyEvent.radiusChanged(radiusKm: km)),
                  ),
                  const Spacer(),
                  if (state.status == NearbyStatus.loaded)
                    Text(
                      l10n.nearbyCount(state.rows.length),
                      style: AppTypography.subtitle,
                    ),
                ],
              ),
            ),
            Expanded(
              child: NearbyList(
                state: state,
                onPick: (Aircraft a) => Navigator.of(context).pop(a),
                onRefresh: () => refresh(bloc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
