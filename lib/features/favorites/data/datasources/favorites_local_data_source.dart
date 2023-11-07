import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoritesLocalDataSource {
  final _favoritesBox = Hive.box('favorites');

  Future<void> addGameToFavorites({
    required int id,
    required String name,
    required String url,
    required int popularity,
  }) async {
    final int favCounter = _favoritesBox.keys.length;

    final Map<String, dynamic> gameData = {
      'id': id,
      'name': name,
      'url': url,
      'popularity': popularity,
      'counter': favCounter + 1,
    };

    await _favoritesBox.put(id, gameData);
  }

  List<Map<String, dynamic>> getGamesData() {
    final List<dynamic> gamesDynamic = [];
    for (int i = 0; i < _favoritesBox.length; i++) {
      gamesDynamic.add(_favoritesBox.getAt(i));
    }

    final gamesData = gamesDynamic.map((dynamic e) {
      final Map<String, dynamic> gameMap = {};
      (e as Map<dynamic, dynamic>).forEach((key, value) {
        gameMap[key.toString()] = value;
      });
      return gameMap;
    }).toList();

    gamesData.sort(
      (a, b) => (b['counter'] as int).compareTo(a['counter'] as int),
    );

    return gamesData;
  }

  bool isGameFavorite({
    required int id,
  }) {
    return _favoritesBox.containsKey(id);
  }

  Future<void> removeGameFromFavorites({
    required int id,
  }) async {
    await _favoritesBox.delete(id);
    await updateCounters();
  }

  Future<void> updateCounters() async {
    final List<Map<String, dynamic>> gamesData = getGamesData();

    for (int i = 0; i < gamesData.length; i++) {
      final int newCounter = gamesData.length - i;
      if (gamesData[i]['counter'] != newCounter) {
        gamesData[i]['counter'] = newCounter;
        await _favoritesBox.put(gamesData[i]['id'], gamesData[i]);
      }
    }
  }
}
