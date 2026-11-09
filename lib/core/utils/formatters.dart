//
//  Contrail
//  formatters.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:intl/intl.dart';

import '../../l10n/generated/app_localizations.dart';

/// Locale-aware number and duration formatting for the UI.
extension ContrailFormatting on AppLocalizations {
  String number(num value) =>
      NumberFormat.decimalPattern(localeName).format(value.round());

  String signedNumber(num value) =>
      value > 0 ? '+${number(value)}' : number(value);

  String duration(Duration d) {
    final int hours = d.inHours;
    final int minutes = d.inMinutes % 60;
    if (hours == 0) return durationMinutes(minutes);
    return durationHoursMinutes(hours, minutes.toString().padLeft(2, '0'));
  }
}
