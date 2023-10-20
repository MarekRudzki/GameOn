import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameon/features/games_genres/data/models/game_genre_model.dart';
import 'package:gameon/features/games_genres/domain/repositories/genres_repository.dart';
import 'package:gameon/features/games_genres/presentation/bloc/games_genres/games_genres_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGenresRepository extends Mock implements GenresRepository {}

void main() {
  late GamesGenresBloc sut;
  late GenresRepository genresRepository;

  setUp(() {
    genresRepository = MockGenresRepository();
    sut = GamesGenresBloc(genresRepository: genresRepository);
  });

  blocTest<GamesGenresBloc, GamesGenresState>(
    'emits [GamesGenresLoading] and [GameGenreSuccess] when GameGenreRequested is added.',
    build: () {
      when(() => genresRepository.getGenres()).thenAnswer(
        (_) async => [
          GameGenreModel(
            name: 'name',
            url: 'url',
            id: 1,
            gamesCount: 2,
          )
        ],
      );
      return sut;
    },
    act: (bloc) => bloc.add(GameGenreRequested()),
    expect: () => [
      GamesGenresLoading(),
      GameGenreSuccess(gameGenreModels: [
        GameGenreModel(
          name: 'name',
          url: 'url',
          id: 1,
          gamesCount: 2,
        ),
      ])
    ],
  );
}
