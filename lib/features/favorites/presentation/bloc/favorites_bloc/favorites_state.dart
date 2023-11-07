part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoriteGameModel> favoriteGames;

  FavoritesLoaded({
    required this.favoriteGames,
  });

  @override
  List<Object> get props => [favoriteGames];
}

class FavoriteChecked extends FavoritesState {
  final bool isFavorite;

  FavoriteChecked({
    required this.isFavorite,
  });

  @override
  List<Object> get props => [isFavorite];
}
