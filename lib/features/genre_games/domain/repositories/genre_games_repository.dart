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
      gamesList.add(GenreGameModel.fromJson(gamesMap[index]!));
    }

    // Sort game genres by rating
    gamesList.sort(
      (a, b) => b.rating.compareTo(a.rating),
    );

    return gamesList;
  }
}
