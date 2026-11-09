//
//  Contrail
//  search_page.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_motion.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../injection.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../state/search/search_bloc.dart';
import '../widgets/search_field.dart';
import '../widgets/search_results.dart';

/// Find a flight; pops with the chosen [Aircraft].
class SearchPage extends StatefulWidget {
  const SearchPage({required this.visible, super.key});

  /// Aircraft already on the map, matched instantly while typing.
  final List<Aircraft> visible;

  static Route<Aircraft> route({required List<Aircraft> visible}) =>
      PageRouteBuilder<Aircraft>(
        opaque: false,
        transitionDuration: AppMotion.micro,
        pageBuilder: (_, _, _) => BlocProvider<SearchBloc>(
          create: (_) => getIt<SearchBloc>(),
          child: SearchPage(visible: visible),
        ),
        transitionsBuilder: (_, Animation<double> anim, _, Widget child) =>
            FadeTransition(opacity: anim, child: child),
      );

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController queryController = TextEditingController();

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  void search(String query, {bool immediate = false}) =>
      context.read<SearchBloc>().add(
        SearchEvent.queryChanged(
          query: query,
          visible: widget.visible,
          immediate: immediate,
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background.withValues(alpha: 0.94),
    body: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.s16 - 2,
          AppSpacing.s8,
          AppSpacing.s16 - 2,
          0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchField(
                    controller: queryController,
                    onChanged: search,
                    onSubmitted: (String q) => search(q, immediate: true),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppLocalizations.of(context).searchCancel,
                    style: const TextStyle(color: AppColors.text),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) =>
                    SearchResults(
                      state: state,
                      onPick: (Aircraft a) => Navigator.of(context).pop(a),
                      onRetry: () =>
                          search(queryController.text, immediate: true),
                    ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
