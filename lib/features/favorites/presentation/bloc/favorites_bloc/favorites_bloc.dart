// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';
import 'package:gameon/features/favorites/data/repositories/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _repository;

  FavoritesBloc({required FavoritesRepository repository})
      : _repository = repository,
        super(FavoritesInitial()) {
    on<FavoritesAddPressed>(_onFavoritesAddPressed);
    on<FavoritesRequested>(_onFavoritesRequested);
    on<FavoritesRemovePressed>(_onFavoritesRemovePressed);
    on<FavoriteCheckPressed>(_onFavoriteCheckPressed);
    on<FavoritePopularityCheckRequested>(_onFavoritePopularityCheckRequested);
  }

  Future<void> _onFavoritesAddPressed(
    FavoritesAddPressed event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      await _repository.addGameToFavorites(
        id: event.id,
        name: event.name,
        url: event.url,
        popularity: event.popularity,
      );
    } catch (e) {
      emit(FavoritesError(message: 'Failed to add favorite: $e'));
    }
  }

  void _onFavoritesRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) {
    try {
      emit(FavoritesLoading());
      final favoriteGames = _repository.getFavoriteGames();
      emit(FavoritesLoaded(favoriteGames: favoriteGames));
    } catch (e) {
      emit(FavoritesError(message: 'Failed to load favorites: $e'));
    }
  }

  Future<void> _onFavoritesRemovePressed(
    FavoritesRemovePressed event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      await _repository.removeGameFromFavorites(id: event.id);
    } catch (e) {
      emit(FavoritesError(message: 'Failed to remove favorite: $e'));
    }
  }

  void _onFavoriteCheckPressed(
    FavoriteCheckPressed event,
    Emitter<FavoritesState> emit,
  ) {
    try {
      final isFavorite = _repository.isGameFavorite(id: event.id);
      emit(FavoriteChecked(isFavorite: isFavorite));
    } catch (e) {
      emit(FavoritesError(message: 'Failed to check favorite: $e'));
    }
  }

  Future<void> _onFavoritePopularityCheckRequested(
    FavoritePopularityCheckRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    // Silent update - no state emission needed
    await _repository.checkForPopularityChange(id: event.id);
  }
}
