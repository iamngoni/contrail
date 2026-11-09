//
//  Contrail
//  hairline_divider.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class HairlineDivider extends StatelessWidget {
  const HairlineDivider({this.spacing = AppSpacing.s16, super.key});

  final double spacing;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: spacing),
    child: const SizedBox(
      height: 0.5,
      width: double.infinity,
      child: ColoredBox(color: AppColors.hairline),
    ),
  );
}
