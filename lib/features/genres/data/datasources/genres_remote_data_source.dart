import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenresRemoteDataSource {
  Future<List<Map<String, dynamic>>> getGenres() async {
    try {
      final rawgKey = dotenv.env['RAWG_Key'];
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/genres?key=$rawgKey');
      final List<dynamic> genresList =
          response.data!['results'] as List<dynamic>;
      return genresList.map((e) => e as Map<String, dynamic>).toList();
    } on DioException {
      throw Exception();
    }
  }
}
