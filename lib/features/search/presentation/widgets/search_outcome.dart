import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:gameon/features/search/data/datasources/search_remote_data_source.dart';
import 'package:gameon/features/search/data/models/search_page_model.dart';
import 'package:gameon/features/search/data/models/searched_game_model.dart';
import 'package:gameon/features/search/domain/repositories/search_repository.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchOutcome extends StatefulWidget {
  final String searchQuery;

  const SearchOutcome({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchOutcome> createState() => _SearchOutcomeState();
}

class _SearchOutcomeState extends State<SearchOutcome> {
  int selectedIndex = 0;

  final SearchBloc _bloc = SearchBloc(
    searchRepository: SearchRepository(
      searchRemoteDataSource: SearchRemoteDataSource(),
    ),
  );
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
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Display options:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 47, 91),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.grid_view,
                          size: 30,
                          color: selectedIndex == 0
                              ? Colors.pinkAccent
                              : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                        thickness: 1.5,
                        endIndent: 7,
                        indent: 7,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.view_agenda_outlined,
                          size: 28,
                          color: selectedIndex == 1
                              ? Colors.pinkAccent
                              : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          if (selectedIndex == 0)
            Expanded(
              child: PagedGridView(
                showNewPageProgressIndicatorAsGridChild: false,
                pagingController: _pagingController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.1,
                ),
                builderDelegate: PagedChildBuilderDelegate<SearchedGameModel>(
                  itemBuilder: (context, item, index) => GridViewTile(
                    name: item.name,
                    url: item.url,
                    gameId: item.gameId,
                    popularity: item.popularity,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: PagedListView(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<SearchedGameModel>(
                  itemBuilder: (context, item, index) => ListViewTile(
                    name: item.name,
                    popularity: item.popularity,
                    gameId: item.gameId,
                    url: item.url,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
