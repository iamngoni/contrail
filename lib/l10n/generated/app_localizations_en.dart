// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Contrail';

  @override
  String get searchPlaceholder => 'Search flights, registrations';

  @override
  String get searchHint => 'BA116, G-STBP, A388…';

  @override
  String get searchCancel => 'Cancel';

  @override
  String get searchIntro =>
      'Search by flight number, registration, Mode S code or aircraft type.';

  @override
  String searchNoResults(String query) {
    return 'Nothing airborne matches \"$query\" right now.';
  }

  @override
  String get searchFailed => 'Search couldn\'t reach the ADS-B network.';

  @override
  String get retry => 'Try again';

  @override
  String get refresh => 'Refresh';

  @override
  String get close => 'Close';

  @override
  String get myLocation => 'My location';

  @override
  String get aboveYouTooltip => 'Aircraft above you';

  @override
  String get onGround => 'On ground';

  @override
  String feet(String feet) {
    return '$feet ft';
  }

  @override
  String airborneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aircraft in the air here',
      one: '1 aircraft in the air here',
      zero: 'No aircraft in the air here',
    );
    return '$_temp0';
  }

  @override
  String get trafficOffline => 'No connection to the ADS-B network';

  @override
  String get trafficLoading => 'Finding aircraft…';

  @override
  String get legendTop => '40k';

  @override
  String get legendBottom => '0 ft';

  @override
  String get locationOff => 'Location is off for Contrail';

  @override
  String get locationNeededForNearby =>
      'Turn on location to see what is above you';

  @override
  String get phaseOnGround => 'On ground';

  @override
  String get phaseFinalApproach => 'Final approach';

  @override
  String get phaseClimbing => 'Climbing';

  @override
  String get phaseDescending => 'Descending';

  @override
  String get phaseCruising => 'Cruising';

  @override
  String get phaseLevel => 'Level';

  @override
  String get routeLoading => 'Looking up route…';

  @override
  String get routeUnknown => 'Route not published for this flight';

  @override
  String routeVia(String stops) {
    return 'via $stops';
  }

  @override
  String departedAgo(String duration) {
    return 'Departed $duration ago';
  }

  @override
  String kmFlown(String km) {
    return '$km km flown';
  }

  @override
  String landsIn(String duration) {
    return 'Lands in ~$duration';
  }

  @override
  String kmToGo(String km) {
    return '$km km to go';
  }

  @override
  String durationHoursMinutes(int hours, String minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationMinutes(int minutes) {
    return '${minutes}m';
  }

  @override
  String get statAltitude => 'Altitude';

  @override
  String get statSpeed => 'Speed';

  @override
  String get statVertical => 'Vertical';

  @override
  String get statHeading => 'Heading';

  @override
  String get unitFeet => 'ft';

  @override
  String get unitKnots => 'kt';

  @override
  String get unitFeetPerMinute => 'fpm';

  @override
  String get groundShort => 'GND';

  @override
  String get followFlight => 'Follow this flight';

  @override
  String get followingFlight => 'Following';

  @override
  String get altitudeProfile => 'Altitude profile';

  @override
  String get profileTakeOff => 'Take-off';

  @override
  String get profileNow => 'Now';

  @override
  String get detailAircraft => 'Aircraft';

  @override
  String get detailRegistration => 'Registration';

  @override
  String get detailModeS => 'Mode S';

  @override
  String get detailSquawk => 'Squawk';

  @override
  String get detailRouteDistance => 'Route distance';

  @override
  String get detailFrom => 'From';

  @override
  String get detailTo => 'To';

  @override
  String distanceKm(String km) {
    return '$km km';
  }

  @override
  String get dataAttribution =>
      'Positions: adsb.lol (ODbL) · Routes: adsb.lol route database, crowd-sourced';

  @override
  String get mapAttribution =>
      'Esri, HERE, Garmin, © OpenStreetMap contributors';

  @override
  String get emergencyGeneral => 'Squawk 7700 · General emergency';

  @override
  String get emergencyRadio => 'Squawk 7600 · Radio failure';

  @override
  String get emergencyHijack => 'Squawk 7500 · Unlawful interference';

  @override
  String emergencyOther(String kind) {
    return 'Emergency: $kind';
  }

  @override
  String get nearbyTitle => 'Above you';

  @override
  String nearbyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aircraft',
      one: '1 aircraft',
    );
    return '$_temp0';
  }

  @override
  String nearbyEmpty(int km) {
    return 'Clear skies: nothing airborne within $km km.';
  }

  @override
  String get nearbyFailed => 'Couldn\'t load the aircraft around you.';

  @override
  String radiusKm(int km) {
    return '$km km';
  }

  @override
  String nearbyDistance(String km, String direction) {
    return '$km km $direction';
  }
}
