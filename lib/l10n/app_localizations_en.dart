// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get favorites => 'Favorites';

  @override
  String get genres => 'Genres';

  @override
  String get noFavoriteGamesFound => 'No favorite games found';

  @override
  String get tryAddSome => 'Try add some!';

  @override
  String get errorLoadingFavorites => 'Error loading favorites';

  @override
  String get errorLoadingGenres => 'Error loading genres';

  @override
  String get noGamesFound => 'No games found';

  @override
  String get tryRestartingThePage => 'Try restarting the page';

  @override
  String get dataProvider => 'Data provider';

  @override
  String get allGamesDataRatings =>
      'All games data, ratings and screenshots are from RAWG database.';

  @override
  String get visitRawgSite => 'Visit RAWG site';

  @override
  String get browserCannotBeOpened => 'The browser cannot be opened.';

  @override
  String get noNetworkConnection => 'No network connection';

  @override
  String get pleaseTurnOnInternet =>
      'Please turn on Internet and application will refresh';

  @override
  String get pleaseConfirm => 'Please confirm';

  @override
  String get doYouWantToExitApp => 'Do you want to exit the app?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get developer => 'Developer';

  @override
  String get esrbRating => 'ESRB rating';

  @override
  String get averagePlaytime => 'Average playtime';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get released => 'Released';

  @override
  String get noData => 'No data';

  @override
  String get playersRating => 'Players rating';

  @override
  String get exceptional => 'Exceptional';

  @override
  String get recommended => 'Recommended';

  @override
  String get meh => 'Meh';

  @override
  String get skip => 'Skip';

  @override
  String get availableOn => 'Available on: ';

  @override
  String get readMore => ' Read more';

  @override
  String get showLess => ' Show less';

  @override
  String get hoursShort => 'h';
}
