import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchRemoteDataSource {
  Future<List<Map<String, dynamic>>> getSearchResults({
    required String searchQuery,
    required int page,
  }) async {
    try {
      final String rawgKey = dotenv.get('RAWG_Key');
      final response = await Dio().get<Map<String, dynamic>>(
          'https://api.rawg.io/api/games?search=$searchQuery&page=$page&ordering=-rating&search_exact=true&key=$rawgKey');
      final List<dynamic> dynamicList =
          response.data!['results'] as List<dynamic>;
      return dynamicList.map((e) => e as Map<String, dynamic>).toList();
    } on DioException {
      throw Exception();
    }
  }
}
