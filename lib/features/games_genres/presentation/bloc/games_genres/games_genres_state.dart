part of 'games_genres_bloc.dart';

class GamesGenresState extends Equatable {
  @override
  List<Object> get props => [];
}

class GamesGenresInitial extends GamesGenresState {}

class GamesGenresLoading extends GamesGenresState {}

class GameGenreSuccess extends GamesGenresState {
  final List<GameGenreModel> gameGenreModels;

  GameGenreSuccess({required this.gameGenreModels});

  @override
  List<Object> get props => [gameGenreModels];
}
