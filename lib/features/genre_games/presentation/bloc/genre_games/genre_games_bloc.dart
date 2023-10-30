import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'genre_games_event.dart';
part 'genre_games_state.dart';

class GenreGamesBloc extends Bloc<GenreGamesEvent, GenreGamesState> {
  final GenreGamesRepository _genreGamesRepository;

  GenreGamesBloc({required GenreGamesRepository genreGamesRepository})
      : _genreGamesRepository = genreGamesRepository,
        super(GenreGamesState()) {
    _onPageRequest.stream
        .flatMap(_fetchGenreGames)
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);
  }

  static const _pageSize = 20;

  final _subscriptions = CompositeSubscription();

  final _onNewListingStateController = BehaviorSubject<GenreGamesState>.seeded(
    GenreGamesState(),
  );

  Stream<GenreGamesState> get onNewListingState =>
      _onNewListingStateController.stream;

  final _onPageRequest = StreamController<GenrePageModel>();

  Sink<GenrePageModel> get onPageRequestSink => _onPageRequest.sink;

  Stream<GenreGamesState> _fetchGenreGames(GenrePageModel genrePage) async* {
    final lastListingState = _onNewListingStateController.value;

    try {
      final newItems = await _genreGamesRepository.getGameModels(
        genreId: genrePage.id,
        page: genrePage.page,
      );
      final isLastPage = newItems.length < _pageSize;
      final nextPageKey = isLastPage ? null : genrePage.id + 1;
      yield GenreGamesState(
        page: nextPageKey,
        genreGames: [
          ...lastListingState.genreGames ?? [],
          ...newItems,
        ],
      );
    } catch (e) {
      yield GenreGamesState(
        error: e,
        page: lastListingState.page,
        genreGames: lastListingState.genreGames,
      );
    }
  }

  void dispose() {
    _onNewListingStateController.close();
    _subscriptions.dispose();
    _onPageRequest.close();
  }
}
