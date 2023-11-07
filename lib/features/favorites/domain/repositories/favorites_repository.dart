import 'package:gameon/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:gameon/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoritesRepository {
  final FavoritesRemoteDataSource _favoritesRemoteDataSource;
  final FavoritesLocalDataSource _favoritesLocalDataSource;

  FavoritesRepository({
    required FavoritesRemoteDataSource favoritesRemoteDataSource,
    required FavoritesLocalDataSource favoritesLocalDataSource,
  })  : _favoritesRemoteDataSource = favoritesRemoteDataSource,
        _favoritesLocalDataSource = favoritesLocalDataSource;

  List<FavoriteGameModel> getFavoriteGames() {
    final List<FavoriteGameModel> favoriteGames = [];

    final List<Map<String, dynamic>> gamesData =
        _favoritesLocalDataSource.getGamesData();

    for (final game in gamesData) {
      favoriteGames.add(FavoriteGameModel.fromJson(game));
    }

    return favoriteGames;
  }

  Future<void> addGameToFavorites({
    required int id,
    required String name,
    required String url,
    required int popularity,
  }) async {
    await _favoritesLocalDataSource.addGameToFavorites(
      id: id,
      name: name,
      url: url,
      popularity: popularity,
    );
  }

  bool isGameFavorite({
    required int id,
  }) {
    return _favoritesLocalDataSource.isGameFavorite(
      id: id,
    );
  }

  Future<void> removeGameFromFavorites({
    required int id,
  }) async {
    await _favoritesLocalDataSource.removeGameFromFavorites(
      id: id,
    );
  }
}
