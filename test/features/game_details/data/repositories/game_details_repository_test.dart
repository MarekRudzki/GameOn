// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/game_details/data/datasources/game_details_remote_data_source.dart';
import 'package:gameon/features/game_details/data/repositories/game_details_repository.dart';

class MockGameDetailsRemoteDataSource extends Mock implements GameDetailsRemoteDataSource {}

void main() {
  late GameDetailsRepository repository;
  late MockGameDetailsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockGameDetailsRemoteDataSource();
    repository = GameDetailsRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('getGameDetails', () {
    test('should return GameDetailsModel with combined data', () async {
      // Arrange
      final gameData = {
        'description_raw': 'Test description',
        'developers': [{'name': 'Test Dev'}],
        'esrb_rating': {'name': 'Mature'},
        'metacritic': 90,
        'parent_platforms': [
          {'platform': {'name': 'PC'}}
        ],
        'playtime': 50,
        'released': '2020-12-10',
        'reviews_count': 1000,
        'ratings': [
          {'title': 'exceptional', 'count': 100}
        ],
      };
      final screenshots = {
        'results': [
          {'image': 'screenshot1.jpg'}
        ]
      };

      when(() => mockRemoteDataSource.getGameDetails(gameId: 1))
          .thenAnswer((_) async => gameData);
      when(() => mockRemoteDataSource.getGameScreenshots(gameId: 1))
          .thenAnswer((_) async => screenshots);

      // Act
      final result = await repository.getGameDetails(gameId: 1);

      // Assert
      expect(result.description, 'Test description');
      expect(result.developers, 'Test Dev');
      verify(() => mockRemoteDataSource.getGameDetails(gameId: 1)).called(1);
      verify(() => mockRemoteDataSource.getGameScreenshots(gameId: 1)).called(1);
    });

    test('should throw exception when remote data source fails', () async {
      // Arrange
      when(() => mockRemoteDataSource.getGameDetails(gameId: 1))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => repository.getGameDetails(gameId: 1), throwsException);
    });
  });
}
