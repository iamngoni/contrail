//
//  Contrail
//  map_attribution.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Required credit for the base map tiles.
class MapAttribution extends StatelessWidget {
  const MapAttribution({super.key});

  @override
  Widget build(BuildContext context) => Text(
    AppLocalizations.of(context).mapAttribution,
    style: AppTypography.caption.copyWith(fontSize: 8),
  );
}
