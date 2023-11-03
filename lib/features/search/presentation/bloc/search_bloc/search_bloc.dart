import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/search/data/models/search_page_model.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';
import 'package:gameon/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  SearchBloc({
    required SearchRepository searchRepository,
  })  : _searchRepository = searchRepository,
        super(SearchState()) {
    _onPageRequest.stream
        .flatMap(_fetchSearchedGames)
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);
  }

  static const _pageSize = 20;

  final _subscriptions = CompositeSubscription();

  final _onNewListingStateController = BehaviorSubject<SearchState>.seeded(
    SearchState(),
  );

  Stream<SearchState> get onNewListingState =>
      _onNewListingStateController.stream;

  final _onPageRequest = StreamController<SearchPageModel>();

  Sink<SearchPageModel> get onPageRequestSink => _onPageRequest.sink;

  Stream<SearchState> _fetchSearchedGames(SearchPageModel searchPage) async* {
    final lastListingState = _onNewListingStateController.value;

    try {
      final newItems = await _searchRepository.getSearchGames(
        searchQuery: searchPage.searchQuery,
        page: searchPage.page,
      );

      final isLastPage = newItems.length < _pageSize;
      final nextPageKey = isLastPage ? null : searchPage.page + 1;

      yield SearchState(
        page: nextPageKey,
        searchedGames: [
          ...lastListingState.searchedGames ?? [],
          ...newItems,
        ],
      );
    } catch (e) {
      yield SearchState(
        error: e,
        page: lastListingState.page,
        searchedGames: lastListingState.searchedGames,
      );
    }
  }

  void dispose() {
    _onNewListingStateController.close();
    _subscriptions.dispose();
    _onPageRequest.close();
  }
}
