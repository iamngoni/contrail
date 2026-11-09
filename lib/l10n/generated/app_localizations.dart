import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Contrail'**
  String get appTitle;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search flights, registrations'**
  String get searchPlaceholder;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'BA116, G-STBP, A388…'**
  String get searchHint;

  /// No description provided for @searchCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get searchCancel;

  /// No description provided for @searchIntro.
  ///
  /// In en, this message translates to:
  /// **'Search by flight number, registration, Mode S code or aircraft type.'**
  String get searchIntro;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'Nothing airborne matches \"{query}\" right now.'**
  String searchNoResults(String query);

  /// No description provided for @searchFailed.
  ///
  /// In en, this message translates to:
  /// **'Search couldn\'t reach the ADS-B network.'**
  String get searchFailed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @myLocation.
  ///
  /// In en, this message translates to:
  /// **'My location'**
  String get myLocation;

  /// No description provided for @aboveYouTooltip.
  ///
  /// In en, this message translates to:
  /// **'Aircraft above you'**
  String get aboveYouTooltip;

  /// No description provided for @onGround.
  ///
  /// In en, this message translates to:
  /// **'On ground'**
  String get onGround;

  /// No description provided for @feet.
  ///
  /// In en, this message translates to:
  /// **'{feet} ft'**
  String feet(String feet);

  /// No description provided for @airborneCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No aircraft in the air here} =1{1 aircraft in the air here} other{{count} aircraft in the air here}}'**
  String airborneCount(int count);

  /// No description provided for @trafficOffline.
  ///
  /// In en, this message translates to:
  /// **'No connection to the ADS-B network'**
  String get trafficOffline;

  /// No description provided for @trafficLoading.
  ///
  /// In en, this message translates to:
  /// **'Finding aircraft…'**
  String get trafficLoading;

  /// No description provided for @legendTop.
  ///
  /// In en, this message translates to:
  /// **'40k'**
  String get legendTop;

  /// No description provided for @legendBottom.
  ///
  /// In en, this message translates to:
  /// **'0 ft'**
  String get legendBottom;

  /// No description provided for @locationOff.
  ///
  /// In en, this message translates to:
  /// **'Location is off for Contrail'**
  String get locationOff;

  /// No description provided for @locationNeededForNearby.
  ///
  /// In en, this message translates to:
  /// **'Turn on location to see what is above you'**
  String get locationNeededForNearby;

  /// No description provided for @phaseOnGround.
  ///
  /// In en, this message translates to:
  /// **'On ground'**
  String get phaseOnGround;

  /// No description provided for @phaseFinalApproach.
  ///
  /// In en, this message translates to:
  /// **'Final approach'**
  String get phaseFinalApproach;

  /// No description provided for @phaseClimbing.
  ///
  /// In en, this message translates to:
  /// **'Climbing'**
  String get phaseClimbing;

  /// No description provided for @phaseDescending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get phaseDescending;

  /// No description provided for @phaseCruising.
  ///
  /// In en, this message translates to:
  /// **'Cruising'**
  String get phaseCruising;

  /// No description provided for @phaseLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get phaseLevel;

  /// No description provided for @routeLoading.
  ///
  /// In en, this message translates to:
  /// **'Looking up route…'**
  String get routeLoading;

  /// No description provided for @routeUnknown.
  ///
  /// In en, this message translates to:
  /// **'Route not published for this flight'**
  String get routeUnknown;

  /// No description provided for @routeVia.
  ///
  /// In en, this message translates to:
  /// **'via {stops}'**
  String routeVia(String stops);

  /// No description provided for @departedAgo.
  ///
  /// In en, this message translates to:
  /// **'Departed {duration} ago'**
  String departedAgo(String duration);

  /// No description provided for @kmFlown.
  ///
  /// In en, this message translates to:
  /// **'{km} km flown'**
  String kmFlown(String km);

  /// No description provided for @landsIn.
  ///
  /// In en, this message translates to:
  /// **'Lands in ~{duration}'**
  String landsIn(String duration);

  /// No description provided for @kmToGo.
  ///
  /// In en, this message translates to:
  /// **'{km} km to go'**
  String kmToGo(String km);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationHoursMinutes(int hours, String minutes);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String durationMinutes(int minutes);

  /// No description provided for @statAltitude.
  ///
  /// In en, this message translates to:
  /// **'Altitude'**
  String get statAltitude;

  /// No description provided for @statSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get statSpeed;

  /// No description provided for @statVertical.
  ///
  /// In en, this message translates to:
  /// **'Vertical'**
  String get statVertical;

  /// No description provided for @statHeading.
  ///
  /// In en, this message translates to:
  /// **'Heading'**
  String get statHeading;

  /// No description provided for @unitFeet.
  ///
  /// In en, this message translates to:
  /// **'ft'**
  String get unitFeet;

  /// No description provided for @unitKnots.
  ///
  /// In en, this message translates to:
  /// **'kt'**
  String get unitKnots;

  /// No description provided for @unitFeetPerMinute.
  ///
  /// In en, this message translates to:
  /// **'fpm'**
  String get unitFeetPerMinute;

  /// No description provided for @groundShort.
  ///
  /// In en, this message translates to:
  /// **'GND'**
  String get groundShort;

  /// No description provided for @followFlight.
  ///
  /// In en, this message translates to:
  /// **'Follow this flight'**
  String get followFlight;

  /// No description provided for @followingFlight.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get followingFlight;

  /// No description provided for @altitudeProfile.
  ///
  /// In en, this message translates to:
  /// **'Altitude profile'**
  String get altitudeProfile;

  /// No description provided for @profileTakeOff.
  ///
  /// In en, this message translates to:
  /// **'Take-off'**
  String get profileTakeOff;

  /// No description provided for @profileNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get profileNow;

  /// No description provided for @detailAircraft.
  ///
  /// In en, this message translates to:
  /// **'Aircraft'**
  String get detailAircraft;

  /// No description provided for @detailRegistration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get detailRegistration;

  /// No description provided for @detailModeS.
  ///
  /// In en, this message translates to:
  /// **'Mode S'**
  String get detailModeS;

  /// No description provided for @detailSquawk.
  ///
  /// In en, this message translates to:
  /// **'Squawk'**
  String get detailSquawk;

  /// No description provided for @detailRouteDistance.
  ///
  /// In en, this message translates to:
  /// **'Route distance'**
  String get detailRouteDistance;

  /// No description provided for @detailFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get detailFrom;

  /// No description provided for @detailTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get detailTo;

  /// No description provided for @distanceKm.
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String distanceKm(String km);

  /// No description provided for @dataAttribution.
  ///
  /// In en, this message translates to:
  /// **'Positions: adsb.lol (ODbL) · Routes: adsb.lol route database, crowd-sourced'**
  String get dataAttribution;

  /// No description provided for @mapAttribution.
  ///
  /// In en, this message translates to:
  /// **'Esri, HERE, Garmin, © OpenStreetMap contributors'**
  String get mapAttribution;

  /// No description provided for @emergencyGeneral.
  ///
  /// In en, this message translates to:
  /// **'Squawk 7700 · General emergency'**
  String get emergencyGeneral;

  /// No description provided for @emergencyRadio.
  ///
  /// In en, this message translates to:
  /// **'Squawk 7600 · Radio failure'**
  String get emergencyRadio;

  /// No description provided for @emergencyHijack.
  ///
  /// In en, this message translates to:
  /// **'Squawk 7500 · Unlawful interference'**
  String get emergencyHijack;

  /// No description provided for @emergencyOther.
  ///
  /// In en, this message translates to:
  /// **'Emergency: {kind}'**
  String emergencyOther(String kind);

  /// No description provided for @nearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Above you'**
  String get nearbyTitle;

  /// No description provided for @nearbyCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 aircraft} other{{count} aircraft}}'**
  String nearbyCount(int count);

  /// No description provided for @nearbyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Clear skies: nothing airborne within {km} km.'**
  String nearbyEmpty(int km);

  /// No description provided for @nearbyFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load the aircraft around you.'**
  String get nearbyFailed;

  /// No description provided for @radiusKm.
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String radiusKm(int km);

  /// No description provided for @nearbyDistance.
  ///
  /// In en, this message translates to:
  /// **'{km} km {direction}'**
  String nearbyDistance(String km, String direction);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
