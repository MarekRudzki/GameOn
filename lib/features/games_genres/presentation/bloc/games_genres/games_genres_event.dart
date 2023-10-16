part of 'games_genres_bloc.dart';

class GamesGenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GameGenreChanged extends GamesGenresEvent {
  final String genre;

  GameGenreChanged({required this.genre});

  @override
  List<Object> get props => [genre];
}
