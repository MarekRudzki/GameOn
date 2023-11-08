// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';

class MockGenreGamesRepository extends Mock implements GenreGamesRepository {}

void main() {
  late GenreGamesRepository genreGamesRepository;
  late GenreGamesBloc sut;

  setUp(() {
    genreGamesRepository = MockGenreGamesRepository();
    sut = GenreGamesBloc(genreGamesRepository: genreGamesRepository);
  });

  final testModel = [
    GenreGameModel(
      name: 'Cyberpunk 2077',
      popularity: 1,
      url: 'url',
      gameId: 1,
    ),
    GenreGameModel(
      name: 'The Witcher 3: Wild Hunt',
      popularity: 1,
      url: 'url',
      gameId: 1,
    )
  ];

  test(
    'should correctly add games to sink and obtaint them in [GenreGamesState]',
    () {
      when(() => genreGamesRepository.getGameModels(genreId: 1, page: 1))
          .thenAnswer((_) async => testModel);
      expectLater(
          sut.onNewListingState,
          emitsInOrder([
            emits(GenreGamesState()),
            emits(GenreGamesState(genreGames: testModel, page: null)),
          ]));

      sut.onPageRequestSink.add(GenrePageModel(page: 1, id: 1));
    },
  );
}
