//
//  Contrail
//  sheet_handle.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.s16),
      child: SizedBox(
        width: 36,
        height: 5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.handle,
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
        ),
      ),
    ),
  );
}
