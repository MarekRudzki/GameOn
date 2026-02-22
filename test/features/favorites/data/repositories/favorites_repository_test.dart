// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:gameon/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:gameon/features/favorites/data/repositories/favorites_repository.dart';

class MockFavoritesLocalDataSource extends Mock implements FavoritesLocalDataSource {}
class MockFavoritesRemoteDataSource extends Mock implements FavoritesRemoteDataSource {}

void main() {
  late FavoritesRepository repository;
  late MockFavoritesLocalDataSource mockLocalDataSource;
  late MockFavoritesRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockLocalDataSource = MockFavoritesLocalDataSource();
    mockRemoteDataSource = MockFavoritesRemoteDataSource();
    repository = FavoritesRepository(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('getFavoriteGames', () {
    test('should return list of FavoriteGameModel from local data source', () {
      // Arrange
      final gamesData = [
        {'id': 1, 'name': 'Game 1', 'url': 'url1', 'popularity': 100},
        {'id': 2, 'name': 'Game 2', 'url': 'url2', 'popularity': 200},
      ];
      when(() => mockLocalDataSource.getGamesData()).thenReturn(gamesData);

      // Act
      final result = repository.getFavoriteGames();

      // Assert
      expect(result.length, 2);
      expect(result[0].name, 'Game 1');
      verify(() => mockLocalDataSource.getGamesData()).called(1);
    });
  });

  group('addGameToFavorites', () {
    test('should call local data source addGameToFavorites', () async {
      // Arrange
      when(() => mockLocalDataSource.addGameToFavorites(
            id: 1,
            name: 'Test',
            url: 'url',
            popularity: 100,
          )).thenAnswer((_) async => Future.value());

      // Act
      await repository.addGameToFavorites(
        id: 1,
        name: 'Test',
        url: 'url',
        popularity: 100,
      );

      // Assert
      verify(() => mockLocalDataSource.addGameToFavorites(
            id: 1,
            name: 'Test',
            url: 'url',
            popularity: 100,
          )).called(1);
    });
  });

  group('isGameFavorite', () {
    test('should return true when game is favorite', () {
      // Arrange
      when(() => mockLocalDataSource.isGameFavorite(id: 1)).thenReturn(true);

      // Act
      final result = repository.isGameFavorite(id: 1);

      // Assert
      expect(result, true);
      verify(() => mockLocalDataSource.isGameFavorite(id: 1)).called(1);
    });

    test('should return false when game is not favorite', () {
      // Arrange
      when(() => mockLocalDataSource.isGameFavorite(id: 1)).thenReturn(false);

      // Act
      final result = repository.isGameFavorite(id: 1);

      // Assert
      expect(result, false);
    });
  });

  group('removeGameFromFavorites', () {
    test('should call local data source removeGameFromFavorites', () async {
      // Arrange
      when(() => mockLocalDataSource.removeGameFromFavorites(id: 1))
          .thenAnswer((_) async => Future.value());

      // Act
      await repository.removeGameFromFavorites(id: 1);

      // Assert
      verify(() => mockLocalDataSource.removeGameFromFavorites(id: 1)).called(1);
    });
  });
}
