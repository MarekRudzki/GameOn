part of 'genre_games_bloc.dart';

final class GenreGamesState extends Equatable {
  final List<GenreGameModel>? genreGames;
  final Object? error;
  final int? page;

  const GenreGamesState({
    this.genreGames,
    this.error,
    this.page = 1,
  });

  @override
  List<Object?> get props => [genreGames, error, page];
}
