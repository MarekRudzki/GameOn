// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/genre_games/data/datasources/genre_games_remote_data_source.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';

@lazySingleton
class GenreGamesRepository {
  final GenreGamesRemoteDataSource _remoteDataSource;

  GenreGamesRepository({required GenreGamesRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  Future<List<GenreGameModel>> getGameModels({
    required int genreId,
    required int page,
  }) async {
    try {
      final genreGames = await _remoteDataSource.getGenreGames(
        genreId: genreId,
        page: page,
      );

      final gamesList = <GenreGameModel>[];
      
      for (final gameMap in genreGames) {
        final gamePopularity = gameMap['added'] as int? ?? 0;
        gamesList.add(GenreGameModel.fromJson(gameMap, gamePopularity));
      }

      gamesList.sort((a, b) => b.popularity.compareTo(a.popularity));

      return gamesList;
    } catch (e) {
      throw Exception('Failed to load genre games: $e');
    }
  }
}
