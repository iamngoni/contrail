//
//  Contrail
//  app.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import 'core/configs/app_theme.dart';
import 'l10n/generated/app_localizations.dart';
import 'traffic/views/pages/map_page.dart';

class ContrailApp extends StatelessWidget {
  const ContrailApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    onGenerateTitle: (BuildContext context) =>
        AppLocalizations.of(context).appTitle,
    debugShowCheckedModeBanner: false,
    theme: AppTheme.dark(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: const MapPage(),
  );
}
