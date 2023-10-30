import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
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

  // blocTest<GenreGamesBloc, GenreGamesState>(
  //   'emits [GenreGamesLoading] and [GenreGamesSuccess] when GenreGamesRequested is added.',
  //   build: () {
  //     when(() => genreGamesRepository.getGameModels(genreId: 5, page: 1))
  //         .thenAnswer(
  //       (_) async => [
  //         GenreGameModel(
  //           name: 'Cyberpunk 2077',
  //           popularity: 1,
  //           url: 'url',
  //         ),
  //         GenreGameModel(
  //           name: 'The Witcher 3: Wild Hunt',
  //           popularity: 1,
  //           url: 'url',
  //         )
  //       ],
  //     );
  //     when(() => sut.fetchGenreGames(GenrePageModel(page: 2, id: 2)))
  //         .thenAnswer((_) => Stream.fromIterable([]));
  //     return sut;
  //   },
  //   act: (bloc) => bloc.fetchGenreGames(GenrePageModel(page: 2, id: 2)),
  //   expect: () => [
  //     GenreGamesState(
  //       genreGames: [
  //         GenreGameModel(
  //           name: 'Cyberpunk 2077',
  //           popularity: 1,
  //           url: 'url',
  //         ),
  //         GenreGameModel(
  //           name: 'The Witcher 3: Wild Hunt',
  //           popularity: 1,
  //           url: 'url',
  //         ),
  //       ],
  //     )
  //   ],
  // );
}
