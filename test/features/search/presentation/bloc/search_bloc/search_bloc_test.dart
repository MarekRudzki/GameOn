import 'package:flutter_test/flutter_test.dart';
import 'package:gameon/features/search/data/models/search_page_model.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';
import 'package:gameon/features/search/domain/repositories/search_repository.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late SearchRepository searchRepository;
  late SearchBloc sut;

  setUp(() {
    searchRepository = MockSearchRepository();
    sut = SearchBloc(searchRepository: searchRepository);
  });

  final testModel = [
    SearchedGameModel(
      name: 'Cyberpunk 2077',
      popularity: 1,
      url: 'url',
      gameId: 1,
    ),
    SearchedGameModel(
      name: 'The Witcher 3: Wild Hunt',
      popularity: 1,
      url: 'url',
      gameId: 1,
    )
  ];

  test(
    'should correctly add games to sink and obtaint them in [SearchedGamesState]',
    () {
      when(() => searchRepository.getSearchGames(searchQuery: '1', page: 1))
          .thenAnswer((_) async => testModel);
      expectLater(
          sut.onNewListingState,
          emitsInOrder([
            emits(SearchState()),
            emits(SearchState(searchedGames: testModel, page: null)),
          ]));

      sut.onPageRequestSink.add(SearchPageModel(searchQuery: '1', page: 1));
    },
  );
}
