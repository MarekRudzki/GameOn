part of 'genre_games_bloc.dart';

class GenreGamesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenreGamesRequested extends GenreGamesEvent {
  final int genreId;

  GenreGamesRequested({required this.genreId});

  @override
  List<Object> get props => [genreId];
}
