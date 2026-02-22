// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/search/data/datasources/search_remote_data_source.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';

@lazySingleton
class SearchRepository {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepository({required SearchRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  Future<List<SearchedGameModel>> getSearchGames({
    required String searchQuery,
    required int page,
  }) async {
    try {
      final gamesList = await _remoteDataSource.getSearchResults(
        searchQuery: searchQuery,
        page: page,
      );

      final gamesModelList = <SearchedGameModel>[];

      for (final gameMap in gamesList) {
        final gamePopularity = gameMap['added'] as int? ?? 0;
        gamesModelList.add(SearchedGameModel.fromJson(gameMap, gamePopularity));
      }

      gamesModelList.sort((a, b) => b.popularity.compareTo(a.popularity));

      return gamesModelList;
    } catch (e) {
      throw Exception('Failed to search games: $e');
    }
  }
}
