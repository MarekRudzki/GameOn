// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/game_details/data/datasources/game_details_remote_data_source.dart';
import 'package:gameon/features/game_details/data/models/game_details_model.dart';

@lazySingleton
class GameDetailsRepository {
  final GameDetailsRemoteDataSource _remoteDataSource;

  GameDetailsRepository({required GameDetailsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  Future<GameDetailsModel> getGameDetails({required int gameId}) async {
    try {
      final gameData = await _remoteDataSource.getGameDetails(gameId: gameId);
      final gameScreenshots = await _remoteDataSource.getGameScreenshots(gameId: gameId);
      
      gameData.addAll(gameScreenshots);

      return GameDetailsModel.fromJson(gameData);
    } catch (e) {
      throw Exception('Failed to load game details: $e');
    }
  }
}
