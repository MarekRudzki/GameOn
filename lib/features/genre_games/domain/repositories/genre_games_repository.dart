import 'package:gameon/features/genre_games/data/datasources/genre_games_remote_data_source.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenreGamesRepository {
  final GenreGamesRemoteDataSource _genreGamesRemoteDataSource;

  GenreGamesRepository(
      {required GenreGamesRemoteDataSource genreGamesRemoteDataSource})
      : _genreGamesRemoteDataSource = genreGamesRemoteDataSource;

  Future<List<GenreGameModel>> getGameModels({
    required int genreId,
    required int page,
  }) async {
    final List<GenreGameModel> gamesList = [];
    final genreGames = await _genreGamesRemoteDataSource.getGenreGames(
      genreId: genreId,
      page: page,
    );
    final gamesMap = genreGames.asMap();

    for (final index in gamesMap.keys) {
      final int gamePopularity = gamesMap[index]!['added'] != null
          ? gamesMap[index]!['added'] as int
          : 0;

      gamesList.add(GenreGameModel.fromJson(gamesMap[index]!, gamePopularity));
    }
    gamesList.sort(
      (a, b) => b.popularity.compareTo(a.popularity),
    );

    return gamesList;
  }
}
