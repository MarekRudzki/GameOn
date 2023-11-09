// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/genres/data/models/genre_model.dart';
import 'package:gameon/features/genres/domain/repositories/genres_repository.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';

class MockGenresRepository extends Mock implements GenresRepository {}

void main() {
  late GenresRepository genresRepository;
  late GenresBloc sut;

  setUp(() {
    genresRepository = MockGenresRepository();
    sut = GenresBloc(
      genresRepository: genresRepository,
    );
  });

  final testModel = GenreModel(
    name: 'name',
    url: 'url',
    id: 1,
    gamesCount: 2,
  );

  blocTest<GenresBloc, GenresState>(
    'emits [GenresLoading] and [GameGenreSuccess] when GameGenreRequested is added.',
    build: () {
      when(() => genresRepository.getGenres()).thenAnswer(
        (_) async => [testModel],
      );
      return sut;
    },
    act: (bloc) => bloc.add(GenresRequested()),
    expect: () => [
      GenresLoading(),
      GenresSuccess(
        gameGenreModels: [
          testModel,
        ],
      )
    ],
  );
}
