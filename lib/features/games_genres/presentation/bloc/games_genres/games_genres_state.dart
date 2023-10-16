part of 'games_genres_bloc.dart';

class GamesGenresState extends Equatable {
  @override
  List<Object> get props => [];
}

class GamesGenresInitial extends GamesGenresState {}

class GenreChangeSuccess extends GamesGenresState {
  final String genre;

  GenreChangeSuccess({required this.genre});

  @override
  List<Object> get props => [genre];
}
