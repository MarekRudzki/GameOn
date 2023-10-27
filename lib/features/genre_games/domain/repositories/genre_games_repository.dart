import 'package:gameon/features/genre_games/data/datasource/genre_games_remote_data_source.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';

class GenreGamesRepository {
  final GenreGamesRemoteDataSource _genreGamesRemoteDataSource;

  GenreGamesRepository(
      {required GenreGamesRemoteDataSource genreGamesRemoteDataSource})
      : _genreGamesRemoteDataSource = genreGamesRemoteDataSource;

  Future<List<GenreGameModel>> getGameModels(int genreId) async {
    final List<GenreGameModel> gamesList = [];
    final genreGames = await _genreGamesRemoteDataSource.getGenreGames(genreId);
    final gamesMap = genreGames.asMap();

    for (final index in gamesMap.keys) {
      final int gameVotes = gamesMap[index]!['added'] as int;
      final Map<String, dynamic> gameVotesByStatus =
          gamesMap[index]!['added_by_status'] as Map<String, dynamic>;
      final int gameVotesToPlay;

      gameVotesByStatus.containsKey('toplay')
          ? gameVotesToPlay = gameVotesByStatus['toplay'] as int
          : gameVotesToPlay = 0;

      final int gamePopularity = gameVotes - gameVotesToPlay;

      gamesList.add(GenreGameModel.fromJson(gamesMap[index]!, gamePopularity));
    }
    return gamesList;
  }
}
