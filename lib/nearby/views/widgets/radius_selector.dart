//
//  Contrail
//  radius_selector.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';

class RadiusSelector extends StatelessWidget {
  const RadiusSelector({
    required this.options,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final List<int> options;
  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: AppSpacing.s8,
      children: [
        for (final int km in options)
          ChoiceChip(
            label: Text(l10n.radiusKm(km)),
            selected: km == selected,
            showCheckmark: false,
            onSelected: (_) => onChanged(km),
          ),
      ],
    );
  }
}
