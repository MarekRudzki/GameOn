import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GameDetailsRemoteDataSource {
  final String rawgKey = dotenv.get('RAWG_Key');

  Future<Map<String, dynamic>> getGameDetails({
    required int gameId,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/games/$gameId?key=$rawgKey');
      return response.data!;
    } on DioException {
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> getGameScreenshots({
    required int gameId,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/games/$gameId/screenshots?key=$rawgKey');
      return response.data!;
    } on DioException {
      throw Exception();
    }
  }
}
