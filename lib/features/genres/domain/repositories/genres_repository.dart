// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/genres/data/datasources/genres_remote_data_source.dart';
import 'package:gameon/features/genres/data/models/genre_model.dart';

@lazySingleton
class GenresRepository {
  final GenresRemoteDataSource _genresRemoteDataSource;

  GenresRepository({required GenresRemoteDataSource genresRemoteDataSource})
      : _genresRemoteDataSource = genresRemoteDataSource;

  Future<List<GenreModel>> getGenres() async {
    final Map<String, String> genresPhotos = {
      'Action':
          'https://media.rawg.io/media/screenshots/2ed/2ed3b2791b3bbed6b98bf362694aeb73.jpg',
      'Indie':
          'https://media.rawg.io/media/screenshots/62b/62b36b00ffc3052880176fa9d20f2741.jpg',
      'RPG':
          'https://media.rawg.io/media/games/26d/26d4437715bee60138dab4a7c8c59c92.jpg',
      'Strategy':
          'https://media.rawg.io/media/screenshots/ccc/cccc59229370b01ba6f5bad75702c713.jpg',
      'Adventure':
          'https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg',
      'Shooter':
          'https://media.rawg.io/media/games/49c/49c3dfa4ce2f6f140cc4825868e858cb.jpg',
      'Casual':
          'https://media.rawg.io/media/games/e74/e74458058b35e01c1ae3feeb39a3f724.jpg',
      'Simulation':
          'https://media.rawg.io/media/games/25c/25c4776ab5723d5d735d8bf617ca12d9.jpg',
      'Puzzle':
          'https://media.rawg.io/media/games/2ba/2bac0e87cf45e5b508f227d281c9252a.jpg',
      'Arcade':
          'https://media.rawg.io/media/screenshots/38b/38b9bb0de0a380434b78587e132b2e21.jpg',
      'Platformer':
          'https://media.rawg.io/media/games/942/9424d6bb763dc38d9378b488603c87fa.jpg',
      'Massively Multiplayer':
          'https://media.rawg.io/media/games/1bd/1bd2657b81eb0c99338120ad444b24ff.jpg',
      'Racing':
          'https://media.rawg.io/media/games/082/082365507ff04d456c700157072d35db.jpg',
      'Sports':
          'https://media.rawg.io/media/games/1a7/1a77ee44d7e91949aa794597d32c2e28.jpg',
      'Fighting':
          'https://media.rawg.io/media/screenshots/3f1/3f1c3eb4721d67581792b67d70cc3932.jpg',
      'Family':
          'https://media.rawg.io/media/games/3ef/3eff92562640e452d3487c04ba6d7fae.jpg',
      'Board Games':
          'https://media.rawg.io/media/screenshots/768/768e36d4b62a1481fef737c6920fbfc7.jpg',
      'Educational':
          'https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg',
      'Card':
          'https://media.rawg.io/media/screenshots/8d2/8d28cef0586f55275458ffc0ea559a94.jpg',
    };

    final List<GenreModel> genreModelList = [];
    final List<Map<String, dynamic>> genresList =
        await _genresRemoteDataSource.getGenres();

    for (final genreMap in genresList) {
      final genreName = genreMap['name'];
      final genreImageUrl = genresPhotos[genreName];

      genreModelList.add(GenreModel.fromJson(
        genreMap,
        genreImageUrl!,
      ));
    }

    // Sort game genres by game count
    genreModelList.sort(
      (a, b) => a.gamesCount.compareTo(b.gamesCount),
    );

    return genreModelList.reversed.toList();
  }
}
