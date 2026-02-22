// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';
import 'package:gameon/features/favorites/data/repositories/favorites_repository.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  late FavoritesRepository favoritesRepository;
  late FavoritesBloc sut;

  setUp(() {
    favoritesRepository = MockFavoritesRepository();
    sut = FavoritesBloc(repository: favoritesRepository);
  });

  final testModel = FavoriteGameModel(
    name: 'Cyberpunk 2077',
    popularity: 1,
    url: 'url',
    gameId: 1,
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'triggers repository method when FavoritesAddPressed is added.',
    build: () {
      when(
        () => favoritesRepository.addGameToFavorites(
          id: 1,
          name: 'Cyberpunk 2077',
          url: 'url',
          popularity: 1,
        ),
      ).thenAnswer((_) async {});
      return sut;
    },
    act: (bloc) => bloc.add(
      FavoritesAddPressed(
        id: 1,
        name: 'Cyberpunk 2077',
        url: 'url',
        popularity: 1,
      ),
    ),
    expect: () => [],
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'emits [FavoritesLoading, FavoritesLoaded] when FavoritesRequested is added.',
    build: () {
      when(() => favoritesRepository.getFavoriteGames()).thenReturn(
        [testModel],
      );
      return sut;
    },
    act: (bloc) => bloc.add(FavoritesRequested()),
    expect: () => [
      FavoritesLoading(),
      FavoritesLoaded(favoriteGames: [testModel]),
    ],
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'triggers repository method when FavoritesRemovePressed is added.',
    build: () {
      when(
        () => favoritesRepository.removeGameFromFavorites(
          id: 1,
        ),
      ).thenAnswer((_) async {});
      return sut;
    },
    act: (bloc) => bloc.add(
      FavoritesRemovePressed(
        id: 1,
      ),
    ),
    expect: () => [],
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'emits [FavoriteChecked] when FavoriteCheckPressed is added.',
    build: () {
      when(() => favoritesRepository.isGameFavorite(id: 1)).thenReturn(
        true,
      );
      return sut;
    },
    act: (bloc) => bloc.add(FavoriteCheckPressed(id: 1)),
    expect: () => [
      FavoriteChecked(
        isFavorite: true,
      ),
    ],
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'triggers repository method when FavoritePopularityCheckRequested is added.',
    build: () {
      when(
        () => favoritesRepository.checkForPopularityChange(
          id: 1,
        ),
      ).thenAnswer((_) async {});
      return sut;
    },
    act: (bloc) => bloc.add(
      FavoritePopularityCheckRequested(
        id: 1,
      ),
    ),
    expect: () => [],
  );

  group('Error handling tests', () {
    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesLoading, FavoritesError] when getFavoriteGames throws exception',
      build: () {
        when(() => favoritesRepository.getFavoriteGames()).thenThrow(
          Exception('Failed to load'),
        );
        return sut;
      },
      act: (bloc) => bloc.add(FavoritesRequested()),
      expect: () => [
        FavoritesLoading(),
        isA<FavoritesError>(),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesError] when addGameToFavorites throws exception',
      build: () {
        when(
          () => favoritesRepository.addGameToFavorites(
            id: 1,
            name: 'Test',
            url: 'url',
            popularity: 1,
          ),
        ).thenThrow(Exception('Failed to add'));
        return sut;
      },
      act: (bloc) => bloc.add(
        FavoritesAddPressed(id: 1, name: 'Test', url: 'url', popularity: 1),
      ),
      expect: () => [isA<FavoritesError>()],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesError] when removeGameFromFavorites throws exception',
      build: () {
        when(() => favoritesRepository.removeGameFromFavorites(id: 1))
            .thenThrow(Exception('Failed to remove'));
        return sut;
      },
      act: (bloc) => bloc.add(FavoritesRemovePressed(id: 1)),
      expect: () => [isA<FavoritesError>()],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesError] when isGameFavorite throws exception',
      build: () {
        when(() => favoritesRepository.isGameFavorite(id: 1))
            .thenThrow(Exception('Failed to check'));
        return sut;
      },
      act: (bloc) => bloc.add(FavoriteCheckPressed(id: 1)),
      expect: () => [isA<FavoritesError>()],
    );
  });
}
