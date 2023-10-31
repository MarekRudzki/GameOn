import 'package:gameon/features/game_details_screen/data/datasources/game_details_remote_data_source.dart';
import 'package:gameon/features/game_details_screen/data/models/game_details_model.dart';

class GameDetailsRepository {
  final GameDetailsRemoteDataSource _gameDetailsRemoteDataSource;

  GameDetailsRepository({
    required GameDetailsRemoteDataSource gameDetailsRemoteDataSource,
  }) : _gameDetailsRemoteDataSource = gameDetailsRemoteDataSource;

  Future<GameDetailsModel> getGameDetails({required int gameId}) async {
    final gameData =
        await _gameDetailsRemoteDataSource.getGameDetails(gameId: gameId);

    return GameDetailsModel.fromJson(gameData);
  }
}
