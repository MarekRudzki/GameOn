part of 'genre_games_bloc.dart';

class GenreGamesState extends Equatable {
  const GenreGamesState();

  @override
  List<Object> get props => [];
}

class GenreGamesInitial extends GenreGamesState {}

class GenreGamesLoading extends GenreGamesState {}

class GenreGamesSuccess extends GenreGamesState {
  final List<GenreGameModel> genreGames;

  GenreGamesSuccess({required this.genreGames});

  @override
  List<Object> get props => [genreGames];
}
