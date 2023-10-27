import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games/genre_games_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGenreGamesRepository extends Mock implements GenreGamesRepository {}

void main() {
  late GenreGamesBloc sut;
  late GenreGamesRepository genreGamesRepository;

  setUp(() {
    genreGamesRepository = MockGenreGamesRepository();
    sut = GenreGamesBloc(genreGamesRepository: genreGamesRepository);
  });

  blocTest<GenreGamesBloc, GenreGamesState>(
    'emits [GenreGamesLoading] and [GenreGamesSuccess] when GenreGamesRequested is added.',
    build: () {
      when(() => genreGamesRepository.getGameModels(5)).thenAnswer(
        (_) async => [
          GenreGameModel(
            name: 'Cyberpunk 2077',
            popularity: 1,
            url: 'url',
          ),
          GenreGameModel(
            name: 'The Witcher 3: Wild Hunt',
            popularity: 1,
            url: 'url',
          )
        ],
      );
      return sut;
    },
    act: (bloc) => bloc.add(GenreGamesRequested(genreId: 5)),
    expect: () => [
      GenreGamesLoading(),
      GenreGamesSuccess(
        genreGames: [
          GenreGameModel(
            name: 'Cyberpunk 2077',
            popularity: 1,
            url: 'url',
          ),
          GenreGameModel(
            name: 'The Witcher 3: Wild Hunt',
            popularity: 1,
            url: 'url',
          )
        ],
      )
    ],
  );
}
