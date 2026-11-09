//
//  Contrail
//  search_results.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/views/widgets/aircraft_list_tile.dart';
import '../../../core/views/widgets/hairline_divider.dart';
import '../../../core/views/widgets/message_view.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../models/data/search_status.dart';
import '../../state/search/search_bloc.dart';

/// Results, progress, empty and failure states for a search.
class SearchResults extends StatelessWidget {
  const SearchResults({
    required this.state,
    required this.onPick,
    required this.onRetry,
    super.key,
  });

  final SearchState state;
  final ValueChanged<Aircraft> onPick;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool searching = state.status == SearchStatus.searching;
    return Column(
      children: [
        SizedBox(
          height: 1,
          child: searching
              ? const LinearProgressIndicator(
                  color: AppColors.muted,
                  backgroundColor: Colors.transparent,
                )
              : null,
        ),
        Expanded(
          child: state.results.isNotEmpty
              ? ListView.separated(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: state.results.length,
                  separatorBuilder: (_, _) => const HairlineDivider(spacing: 0),
                  itemBuilder: (BuildContext context, int i) {
                    final Aircraft a = state.results[i];
                    return AircraftListTile(
                      aircraft: a,
                      includeRegistration: true,
                      trailingTop: a.onGround
                          ? l10n.onGround
                          : l10n.feet(l10n.number(a.altitudeFt ?? 0)),
                      trailingBottom: null,
                      onTap: () => onPick(a),
                    );
                  },
                )
              : Align(
                  alignment: Alignment.topCenter,
                  child: switch (state.status) {
                    SearchStatus.failure => MessageView(
                      message: l10n.searchFailed,
                      onRetry: onRetry,
                    ),
                    SearchStatus.done => MessageView(
                      message: l10n.searchNoResults(state.query),
                    ),
                    SearchStatus.idle || SearchStatus.searching => MessageView(
                      message: l10n.searchIntro,
                    ),
                  },
                ),
        ),
      ],
    );
  }
}
