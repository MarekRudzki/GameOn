import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenreGamesRemoteDataSource {
  final rawgKey = dotenv.get('RAWG_Key');

  Future<List<Map<String, dynamic>>> getGenreGames({
    required int genreId,
    required int page,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/games?genres=$genreId&page=$page&key=$rawgKey');
      final List<dynamic> genreGames =
          response.data!['results'] as List<dynamic>;
      return genreGames.map((e) => e as Map<String, dynamic>).toList();
    } on DioException {
      throw Exception();
    }
  }
}
