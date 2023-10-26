part of 'genres_bloc.dart';

class GenresState extends Equatable {
  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresSuccess extends GenresState {
  final List<GenreModel> gameGenreModels;

  GenresSuccess({required this.gameGenreModels});

  @override
  List<Object> get props => [gameGenreModels];
}
