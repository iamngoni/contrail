//
//  Contrail
//  detail_row.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_spacing.dart';
import '../../../core/configs/app_typography.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.half + 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 112,
          child: Text(
            label,
            style: AppTypography.subtitle.copyWith(fontSize: 12.5),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
