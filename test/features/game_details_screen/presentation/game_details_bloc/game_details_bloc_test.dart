// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:gameon/features/game_details_screen/data/models/game_details_model.dart';
import 'package:gameon/features/game_details_screen/data/models/user_rating_model.dart';
import 'package:gameon/features/game_details_screen/domain/repositories/game_details_repository.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';

class MockGameDetailsRepository extends Mock implements GameDetailsRepository {}

void main() {
  late GameDetailsRepository gameDetailsRepository;
  late GameDetailsBloc sut;

  setUp(() {
    gameDetailsRepository = MockGameDetailsRepository();
    sut = GameDetailsBloc(
      gameDetailsRepository: gameDetailsRepository,
    );
  });
  final GameDetailsModel testModel = GameDetailsModel(
    description: 'description',
    developers: 'developers',
    esrbRating: 'esrbRating',
    metacritic: 1,
    platforms: ['platforms'],
    playtime: 1,
    released: 'released',
    reviewsCount: 1,
    screenshots: ['screenshots'],
    userRating:
        UserRatingModel(exceptional: 1, recommended: 1, meh: 1, skip: 1),
  );

  blocTest<GameDetailsBloc, GameDetailsState>(
    'emits [GameDetailsLoading] and [GameDetailsSuccess] when GameDetailsRequested is added.',
    build: () {
      when(() => gameDetailsRepository.getGameDetails(gameId: 1))
          .thenAnswer((_) async => testModel);
      return sut;
    },
    act: (bloc) => bloc.add(GameDetailsRequested(gameId: 1)),
    expect: () => [
      GameDetailsLoading(),
      GameDetailsSuccess(gameDetails: testModel),
    ],
  );
}
