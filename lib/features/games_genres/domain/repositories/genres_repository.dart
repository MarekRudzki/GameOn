import 'package:gameon/features/games_genres/data/datasources/genres_remote_data_source.dart';
import 'package:gameon/features/games_genres/data/models/game_genre_model.dart';

class GenresRepository {
  final GenresRemoteDataSource _genresRemoteDataSource;

  GenresRepository({required GenresRemoteDataSource genresRemoteDataSource})
      : _genresRemoteDataSource = genresRemoteDataSource;

  Future<List<GameGenreModel>> getGenres() async {
    final List<String> genresGamesPhotos = [
      'https://media.rawg.io/media/screenshots/2ed/2ed3b2791b3bbed6b98bf362694aeb73.jpg',
      'https://media.rawg.io/media/screenshots/62b/62b36b00ffc3052880176fa9d20f2741.jpg',
      'https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg',
      'https://media.rawg.io/media/games/26d/26d4437715bee60138dab4a7c8c59c92.jpg',
      'https://media.rawg.io/media/screenshots/ccc/cccc59229370b01ba6f5bad75702c713.jpg',
      'https://media.rawg.io/media/games/49c/49c3dfa4ce2f6f140cc4825868e858cb.jpg',
      'https://media.rawg.io/media/games/e74/e74458058b35e01c1ae3feeb39a3f724.jpg',
      'https://media.rawg.io/media/games/25c/25c4776ab5723d5d735d8bf617ca12d9.jpg',
      'https://media.rawg.io/media/games/2ba/2bac0e87cf45e5b508f227d281c9252a.jpg',
      'https://media.rawg.io/media/screenshots/38b/38b9bb0de0a380434b78587e132b2e21.jpg',
      'https://media.rawg.io/media/games/942/9424d6bb763dc38d9378b488603c87fa.jpg',
      'https://media.rawg.io/media/games/1bd/1bd2657b81eb0c99338120ad444b24ff.jpg',
      'https://media.rawg.io/media/games/082/082365507ff04d456c700157072d35db.jpg',
      'https://media.rawg.io/media/games/1a7/1a77ee44d7e91949aa794597d32c2e28.jpg',
      'https://media.rawg.io/media/screenshots/3f1/3f1c3eb4721d67581792b67d70cc3932.jpg',
      'https://media.rawg.io/media/games/3ef/3eff92562640e452d3487c04ba6d7fae.jpg',
      'https://media.rawg.io/media/screenshots/768/768e36d4b62a1481fef737c6920fbfc7.jpg',
      'https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg',
      'https://media.rawg.io/media/screenshots/8d2/8d28cef0586f55275458ffc0ea559a94.jpg',
    ];
    final List<GameGenreModel> genreModelList = [];
    final List<Map<String, dynamic>> genresList =
        await _genresRemoteDataSource.getGamesGenres();

    final genresMap = genresList.asMap();

    for (final index in genresMap.keys) {
      genreModelList.add(GameGenreModel.fromJson(
        genresMap[index]!,
        genresGamesPhotos[index],
      ));
    }

    // Sort game genres by game count
    genreModelList.sort(
      (a, b) => a.gamesCount.compareTo(b.gamesCount),
    );

    return genreModelList.reversed.toList();
  }
}
