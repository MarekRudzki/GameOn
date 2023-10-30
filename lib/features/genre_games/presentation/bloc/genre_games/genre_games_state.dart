part of 'genre_games_bloc.dart';

class GenreGamesState {
  final List<GenreGameModel>? genreGames;
  final dynamic error;
  final int? page;

  GenreGamesState({
    this.genreGames,
    this.error,
    this.page = 1,
  });
}
