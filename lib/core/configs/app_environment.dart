//
//  Contrail
//  app_environment.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

/// Which build is running. Every environment reads the same public
/// ADS-B network; they differ in diagnostics only.
enum AppEnvironment {
  development,
  staging,
  production;

  bool get logsRequests => this != AppEnvironment.production;

  /// Live positions and searches.
  String get adsbApiBase => 'https://api.adsb.lol';

  /// Recorded flight tracks.
  String get adsbDataBase => 'https://adsb.lol';

  /// Crowd-sourced flight routes.
  String get adsbRoutesBase => 'https://vrs-standing-data.adsb.lol';

  /// Dark base map tiles (Esri World Dark Gray Canvas).
  String get tileUrlTemplate =>
      'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/'
      'World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}';
}
