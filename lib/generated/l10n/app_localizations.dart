import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// No description provided for @noFavoriteGamesFound.
  ///
  /// In en, this message translates to:
  /// **'No favorite games found'**
  String get noFavoriteGamesFound;

  /// No description provided for @tryAddSome.
  ///
  /// In en, this message translates to:
  /// **'Try add some!'**
  String get tryAddSome;

  /// No description provided for @errorLoadingFavorites.
  ///
  /// In en, this message translates to:
  /// **'Error loading favorites'**
  String get errorLoadingFavorites;

  /// No description provided for @errorLoadingGenres.
  ///
  /// In en, this message translates to:
  /// **'Error loading genres'**
  String get errorLoadingGenres;

  /// No description provided for @noGamesFound.
  ///
  /// In en, this message translates to:
  /// **'No games found'**
  String get noGamesFound;

  /// No description provided for @tryRestartingThePage.
  ///
  /// In en, this message translates to:
  /// **'Try restarting the page'**
  String get tryRestartingThePage;

  /// No description provided for @dataProvider.
  ///
  /// In en, this message translates to:
  /// **'Data provider'**
  String get dataProvider;

  /// No description provided for @allGamesDataRatings.
  ///
  /// In en, this message translates to:
  /// **'All games data, ratings and screenshots are from RAWG database.'**
  String get allGamesDataRatings;

  /// No description provided for @visitRawgSite.
  ///
  /// In en, this message translates to:
  /// **'Visit RAWG site'**
  String get visitRawgSite;

  /// No description provided for @browserCannotBeOpened.
  ///
  /// In en, this message translates to:
  /// **'The browser cannot be opened.'**
  String get browserCannotBeOpened;

  /// No description provided for @noNetworkConnection.
  ///
  /// In en, this message translates to:
  /// **'No network connection'**
  String get noNetworkConnection;

  /// No description provided for @pleaseTurnOnInternet.
  ///
  /// In en, this message translates to:
  /// **'Please turn on Internet and application will refresh'**
  String get pleaseTurnOnInternet;

  /// No description provided for @pleaseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm'**
  String get pleaseConfirm;

  /// No description provided for @doYouWantToExitApp.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the app?'**
  String get doYouWantToExitApp;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @esrbRating.
  ///
  /// In en, this message translates to:
  /// **'ESRB rating'**
  String get esrbRating;

  /// No description provided for @averagePlaytime.
  ///
  /// In en, this message translates to:
  /// **'Average playtime'**
  String get averagePlaytime;

  /// No description provided for @metacritic.
  ///
  /// In en, this message translates to:
  /// **'Metacritic'**
  String get metacritic;

  /// No description provided for @released.
  ///
  /// In en, this message translates to:
  /// **'Released'**
  String get released;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @playersRating.
  ///
  /// In en, this message translates to:
  /// **'Players rating'**
  String get playersRating;

  /// No description provided for @exceptional.
  ///
  /// In en, this message translates to:
  /// **'Exceptional'**
  String get exceptional;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @meh.
  ///
  /// In en, this message translates to:
  /// **'Meh'**
  String get meh;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @availableOn.
  ///
  /// In en, this message translates to:
  /// **'Available on: '**
  String get availableOn;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **' Read more'**
  String get readMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **' Show less'**
  String get showLess;

  /// No description provided for @hoursShort.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get hoursShort;

  /// No description provided for @games.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get games;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @displayOptions.
  ///
  /// In en, this message translates to:
  /// **'Display options:'**
  String get displayOptions;
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
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
