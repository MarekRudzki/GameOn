// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get favorites => 'Ulubione';

  @override
  String get genres => 'Gatunki';

  @override
  String get noFavoriteGamesFound => 'Nie znaleziono ulubionych gier';

  @override
  String get tryAddSome => 'Spróbuj dodać kilka!';

  @override
  String get errorLoadingFavorites => 'Błąd ładowania ulubionych';

  @override
  String get errorLoadingGenres => 'Błąd ładowania gatunków';

  @override
  String get noGamesFound => 'Nie znaleziono gier';

  @override
  String get tryRestartingThePage => 'Spróbuj odświeżyć stronę';

  @override
  String get dataProvider => 'Dostawca danych';

  @override
  String get allGamesDataRatings =>
      'Wszystkie dane gier, oceny i zrzuty ekranu pochodzą z bazy danych RAWG.';

  @override
  String get visitRawgSite => 'Odwiedź stronę RAWG';

  @override
  String get browserCannotBeOpened => 'Nie można otworzyć przeglądarki.';

  @override
  String get noNetworkConnection => 'Brak połączenia z siecią';

  @override
  String get pleaseTurnOnInternet =>
      'Włącz Internet, a aplikacja odświeży się automatycznie';

  @override
  String get pleaseConfirm => 'Potwierdź';

  @override
  String get doYouWantToExitApp => 'Czy chcesz wyjść z aplikacji?';

  @override
  String get no => 'Nie';

  @override
  String get yes => 'Tak';

  @override
  String get developer => 'Deweloper';

  @override
  String get esrbRating => 'Ocena ESRB';

  @override
  String get averagePlaytime => 'Średni czas gry';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get released => 'Wydano';

  @override
  String get noData => 'Brak danych';

  @override
  String get playersRating => 'Ocena graczy';

  @override
  String get exceptional => 'Wyjątkowa';

  @override
  String get recommended => 'Polecana';

  @override
  String get meh => 'Średnia';

  @override
  String get skip => 'Pomiń';

  @override
  String get availableOn => 'Dostępne na: ';

  @override
  String get readMore => ' Czytaj więcej';

  @override
  String get showLess => ' Pokaż mniej';

  @override
  String get hoursShort => 'godz.';

  @override
  String get games => 'Gry';

  @override
  String get search => 'Szukaj';

  @override
  String get displayOptions => 'Opcje wyświetlania:';
}
