// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoritesRemoteDataSource {
  final Dio _dio;

  FavoritesRemoteDataSource() : _dio = Dio();

  Future<Map<String, dynamic>> getFavoriteGameData({required int gameId}) async {
    try {
      final rawgKey = dotenv.env['RAWG_Key'];
      if (rawgKey == null || rawgKey.isEmpty) {
        throw Exception('RAWG API key not found');
      }

      final response = await _dio.get<Map<String, dynamic>>(
        'https://api.rawg.io/api/games/$gameId?key=$rawgKey',
      );

      if (response.data == null) {
        throw Exception('No data received from API');
      }

      return response.data!;
    } on DioException catch (e) {
      throw Exception('Failed to fetch game data: ${e.message}');
    }
  }
}
