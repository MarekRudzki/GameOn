// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoritesRemoteDataSource {
  Future<Map<String, dynamic>> getFavoriteGameData({
    required int gameId,
  }) async {
    try {
      final String rawgKey = dotenv.get('RAWG_Key');
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/games/$gameId?key=$rawgKey');
      return response.data!;
    } on DioException {
      throw Exception();
    }
  }
}
