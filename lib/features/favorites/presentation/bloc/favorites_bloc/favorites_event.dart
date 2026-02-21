part of 'favorites_bloc.dart';

class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesRequested extends FavoritesEvent {}

class FavoritesAddPressed extends FavoritesEvent {
  final int id;
  final String name;
  final String url;
  final int popularity;

  const FavoritesAddPressed({
    required this.id,
    required this.name,
    required this.url,
    required this.popularity,
  });

  @override
  List<Object> get props => [
        id,
        name,
        url,
        popularity,
      ];
}

class FavoritesRemovePressed extends FavoritesEvent {
  final int id;

  const FavoritesRemovePressed({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class FavoriteCheckPressed extends FavoritesEvent {
  final int id;

  const FavoriteCheckPressed({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class FavoritePopularityCheckRequested extends FavoritesEvent {
  final int id;

  const FavoritePopularityCheckRequested({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
