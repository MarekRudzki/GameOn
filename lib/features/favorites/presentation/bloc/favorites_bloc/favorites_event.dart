part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesRequested extends FavoritesEvent {}

final class FavoritesAddPressed extends FavoritesEvent {
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
  List<Object> get props => [id, name, url, popularity];
}

final class FavoritesRemovePressed extends FavoritesEvent {
  final int id;

  const FavoritesRemovePressed({required this.id});

  @override
  List<Object> get props => [id];
}

final class FavoriteCheckPressed extends FavoritesEvent {
  final int id;

  const FavoriteCheckPressed({required this.id});

  @override
  List<Object> get props => [id];
}

final class FavoritePopularityCheckRequested extends FavoritesEvent {
  final int id;

  const FavoritePopularityCheckRequested({required this.id});

  @override
  List<Object> get props => [id];
}
