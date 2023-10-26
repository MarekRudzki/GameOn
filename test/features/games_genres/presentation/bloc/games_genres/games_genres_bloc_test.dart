import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameon/features/genres/data/models/genre_model.dart';
import 'package:gameon/features/genres/domain/repositories/genres_repository.dart';
import 'package:gameon/features/genres/presentation/bloc/genres/genres_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGenresRepository extends Mock implements GenresRepository {}

void main() {
  late GenresBloc sut;
  late GenresRepository genresRepository;

  setUp(() {
    genresRepository = MockGenresRepository();
    sut = GenresBloc(genresRepository: genresRepository);
  });

  blocTest<GenresBloc, GenresState>(
    'emits [GenresLoading] and [GameGenreSuccess] when GameGenreRequested is added.',
    build: () {
      when(() => genresRepository.getGenres()).thenAnswer(
        (_) async => [
          GenreModel(
            name: 'name',
            url: 'url',
            id: 1,
            gamesCount: 2,
          )
        ],
      );
      return sut;
    },
    act: (bloc) => bloc.add(GenresRequested()),
    expect: () => [
      GenresLoading(),
      GenresSuccess(gameGenreModels: [
        GenreModel(
          name: 'name',
          url: 'url',
          id: 1,
          gamesCount: 2,
        ),
      ])
    ],
  );
}
