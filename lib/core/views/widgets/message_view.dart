//
//  Contrail
//  message_view.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

/// Centred explanation with an optional retry action.
class MessageView extends StatelessWidget {
  const MessageView({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(AppSpacing.s32),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.muted, fontSize: 13.5),
        ),
        if (onRetry != null) ...[
          const SizedBox(height: AppSpacing.s16),
          OutlinedButton(
            onPressed: onRetry,
            child: Text(AppLocalizations.of(context).retry),
          ),
        ],
      ],
    ),
  );
}
