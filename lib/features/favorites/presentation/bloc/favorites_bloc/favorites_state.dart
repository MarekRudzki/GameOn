part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<FavoriteGameModel> favoriteGames;

  const FavoritesLoaded({required this.favoriteGames});

  @override
  List<Object> get props => [favoriteGames];
}

final class FavoriteChecked extends FavoritesState {
  final bool isFavorite;

  const FavoriteChecked({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}

final class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError({required this.message});

  @override
  List<Object> get props => [message];
}
