part of 'genres_bloc.dart';

sealed class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

final class GenresInitial extends GenresState {
  const GenresInitial();
}

final class GenresLoading extends GenresState {
  const GenresLoading();
}

final class GenresSuccess extends GenresState {
  final List<GenreModel> gameGenreModels;

  const GenresSuccess({required this.gameGenreModels});

  @override
  List<Object> get props => [gameGenreModels];
}

final class GenresError extends GenresState {
  final String message;

  const GenresError({required this.message});

  @override
  List<Object> get props => [message];
}
