// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/search/data/datasources/search_remote_data_source.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';

@lazySingleton
class SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepository({
    required SearchRemoteDataSource searchRemoteDataSource,
  }) : _searchRemoteDataSource = searchRemoteDataSource;

  Future<List<SearchedGameModel>> getSearchGames({
    required String searchQuery,
    required int page,
  }) async {
    final List<SearchedGameModel> gamesModelList = [];
    final List<Map<String, dynamic>> gamesList =
        await _searchRemoteDataSource.getSearchResults(
      searchQuery: searchQuery,
      page: page,
    );
    final gamesMap = gamesList.asMap();

    for (final index in gamesMap.keys) {
      final int gamePopularity = gamesMap[index]!['added'] != null
          ? gamesMap[index]!['added'] as int
          : 0;
      final gameData = SearchedGameModel.fromJson(
        gamesMap[index]!,
        gamePopularity,
      );

      gamesModelList.sort(
        (a, b) => b.popularity.compareTo(a.popularity),
      );

      gamesModelList.add(gameData);
    }

    return gamesModelList;
  }
}
