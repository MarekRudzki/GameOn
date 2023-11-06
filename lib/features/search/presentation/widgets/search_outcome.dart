import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/paged_view_no_item_found.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:gameon/features/search/data/models/search_page_model.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:gameon/utils/di.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchOutcome extends StatefulWidget {
  final String searchQuery;
  final int selectedIndex;

  const SearchOutcome({
    super.key,
    required this.searchQuery,
    required this.selectedIndex,
  });

  @override
  State<SearchOutcome> createState() => _SearchOutcomeState();
}

class _SearchOutcomeState extends State<SearchOutcome> {
  final SearchBloc _bloc = getIt<SearchBloc>();

  late StreamSubscription<SearchState> _blocListingStateSubscription;

  final PagingController<int, SearchedGameModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _bloc.onPageRequestSink.add(
        SearchPageModel(
          page: pageKey,
          searchQuery: widget.searchQuery,
        ),
      );
    });

    _blocListingStateSubscription =
        _bloc.onNewListingState.listen((listingState) {
      _pagingController.value = PagingState(
        nextPageKey: listingState.page,
        error: listingState.error,
        itemList: listingState.searchedGames,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _blocListingStateSubscription.cancel();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String errorText =
        'The game you are looking for is not in the database or its name has been misspelled. Try again!';
    return widget.selectedIndex == 0
        ? PagedGridView(
            showNewPageProgressIndicatorAsGridChild: false,
            pagingController: _pagingController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              childAspectRatio: 1 / 1.1,
            ),
            builderDelegate: PagedChildBuilderDelegate<SearchedGameModel>(
              noItemsFoundIndicatorBuilder: (context) => PagedViewNoItemFound(
                text: errorText,
              ),
              itemBuilder: (context, item, index) => GridViewTile(
                name: item.name,
                url: item.url,
                gameId: item.gameId,
                popularity: item.popularity,
              ),
            ),
          )
        : PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<SearchedGameModel>(
              noItemsFoundIndicatorBuilder: (context) => PagedViewNoItemFound(
                text: errorText,
              ),
              itemBuilder: (context, item, index) => ListViewTile(
                name: item.name,
                popularity: item.popularity,
                gameId: item.gameId,
                url: item.url,
              ),
            ),
          );
  }
}
