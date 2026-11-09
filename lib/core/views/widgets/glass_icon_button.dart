//
//  Contrail
//  glass_icon_button.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import 'glass_panel.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.active = false,
    super.key,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: tooltip,
    child: Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onPressed,
        child: GlassPanel(
          child: SizedBox.square(
            dimension: AppSpacing.touchTarget,
            child: Icon(
              icon,
              size: 20,
              color: active ? AppColors.amber : AppColors.control,
            ),
          ),
        ),
      ),
    ),
  );
}
