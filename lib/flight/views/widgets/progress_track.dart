//
//  Contrail
//  progress_track.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_motion.dart';

/// Thin progress line with a dot at the aircraft's position.
class ProgressTrack extends StatelessWidget {
  const ProgressTrack({required this.progress, super.key});

  /// 0..1.
  final double progress;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints c) {
      final double filled = c.maxWidth * progress;
      return SizedBox(
        height: 10,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const SizedBox(
              height: 2,
              width: double.infinity,
              child: ColoredBox(color: AppColors.track),
            ),
            AnimatedContainer(
              duration: AppMotion.content,
              curve: AppMotion.curve,
              height: 2,
              width: filled,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.indigo, AppColors.amber],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: AppMotion.content,
              curve: AppMotion.curve,
              left: (filled - 4).clamp(0, c.maxWidth - 8),
              child: const SizedBox.square(
                dimension: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
