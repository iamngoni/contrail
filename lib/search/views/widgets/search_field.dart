//
//  Contrail
//  search_field.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';
import '../../../core/views/widgets/glass_panel.dart';
import '../../../l10n/generated/app_localizations.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) => GlassPanel(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16 - 4),
    child: TextField(
      controller: controller,
      autofocus: true,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.characters,
      autocorrect: false,
      style: AppTypography.body,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: const Icon(
          Icons.search_rounded,
          size: 19,
          color: AppColors.muted,
        ),
        hintText: AppLocalizations.of(context).searchHint,
        hintStyle: AppTypography.bodyMuted,
      ),
    ),
  );
}
