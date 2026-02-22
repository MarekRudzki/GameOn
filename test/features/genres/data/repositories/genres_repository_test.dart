// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/genres/data/datasources/genres_remote_data_source.dart';
import 'package:gameon/features/genres/data/repositories/genres_repository.dart';

class MockGenresRemoteDataSource extends Mock implements GenresRemoteDataSource {}

void main() {
  late GenresRepository repository;
  late MockGenresRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockGenresRemoteDataSource();
    repository = GenresRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('getGenres', () {
    test('should return sorted list of GenreModel', () async {
      // Arrange
      final genresList = [
        {'id': 1, 'name': 'Action', 'games_count': 100},
        {'id': 2, 'name': 'RPG', 'games_count': 200},
      ];
      when(() => mockRemoteDataSource.getGenres()).thenAnswer((_) async => genresList);

      // Act
      final result = await repository.getGenres();

      // Assert
      expect(result.length, 2);
      expect(result[0].gamesCount, 200); // Sorted by games_count descending
      expect(result[1].gamesCount, 100);
      verify(() => mockRemoteDataSource.getGenres()).called(1);
    });

    test('should throw exception when remote data source fails', () async {
      // Arrange
      when(() => mockRemoteDataSource.getGenres()).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => repository.getGenres(), throwsException);
    });

    test('should filter out genres without image URL', () async {
      // Arrange
      final genresList = [
        {'id': 1, 'name': 'Action', 'games_count': 100},
        {'id': 2, 'name': 'Unknown Genre', 'games_count': 200},
      ];
      when(() => mockRemoteDataSource.getGenres()).thenAnswer((_) async => genresList);

      // Act
      final result = await repository.getGenres();

      // Assert
      expect(result.length, 1); // Only Action has image URL
      expect(result[0].name, 'Action');
    });
  });
}
