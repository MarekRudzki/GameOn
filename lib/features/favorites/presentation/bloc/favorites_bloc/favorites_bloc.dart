import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';
import 'package:gameon/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:injectable/injectable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favoritesRepository;
  FavoritesBloc(this._favoritesRepository) : super(FavoritesInitial()) {
    on<FavoritesAddPressed>(_onFavoritesAddPressed);
    on<FavoritesRequested>(_onFavoritesRequested);
    on<FavoritesRemovePressed>(_onFavoritesRemovePressed);
    on<FavoriteCheckPressed>(_onFavoriteChecked);
  }

  Future<void> _onFavoritesAddPressed(
    FavoritesAddPressed event,
    Emitter<FavoritesState> emit,
  ) async {
    await _favoritesRepository.addGameToFavorites(
      id: event.id,
      name: event.name,
      url: event.url,
      popularity: event.popularity,
    );
  }

  void _onFavoritesRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) {
    final favoriteGames = _favoritesRepository.getFavoriteGames();
    emit(
      FavoritesLoaded(favoriteGames: favoriteGames),
    );
  }

  Future<void> _onFavoritesRemovePressed(
    FavoritesRemovePressed event,
    Emitter<FavoritesState> emit,
  ) async {
    await _favoritesRepository.removeGameFromFavorites(
      id: event.id,
    );
  }

  void _onFavoriteChecked(
    FavoriteCheckPressed event,
    Emitter<FavoritesState> emit,
  ) {
    final bool isFavorite = _favoritesRepository.isGameFavorite(
      id: event.id,
    );
    emit(
      FavoriteChecked(
        isFavorite: isFavorite,
      ),
    );
  }
}
