// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:gameon/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';

@lazySingleton
class FavoritesRepository {
  final FavoritesRemoteDataSource _remoteDataSource;
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepository({
    required FavoritesRemoteDataSource remoteDataSource,
    required FavoritesLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  List<FavoriteGameModel> getFavoriteGames() {
    final gamesData = _localDataSource.getGamesData();
    return gamesData.map((game) => FavoriteGameModel.fromJson(game)).toList();
  }

  Future<void> addGameToFavorites({
    required int id,
    required String name,
    required String url,
    required int popularity,
  }) async {
    await _localDataSource.addGameToFavorites(
      id: id,
      name: name,
      url: url,
      popularity: popularity,
    );
  }

  bool isGameFavorite({required int id}) {
    return _localDataSource.isGameFavorite(id: id);
  }

  Future<void> removeGameFromFavorites({required int id}) async {
    await _localDataSource.removeGameFromFavorites(id: id);
  }

  Future<void> checkForPopularityChange({required int id}) async {
    try {
      final savedData = _localDataSource.getSingleGameData(id: id);
      final savedPopularity = savedData['popularity'] as int;

      final actualData = await _remoteDataSource.getFavoriteGameData(gameId: id);
      final actualPopularity = actualData['added'] as int;

      if (savedPopularity != actualPopularity) {
        _localDataSource.updatePopularity(
          newPopularity: actualPopularity,
          id: id,
        );
      }
    } catch (e) {
      // Ignore errors - popularity check is not critical
    }
  }
}
