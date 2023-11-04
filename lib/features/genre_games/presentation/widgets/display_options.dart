import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameon/features/genre_games/data/datasources/genre_games_remote_data_source.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DisplayOptions extends StatefulWidget {
  final int genreId;

  const DisplayOptions({
    super.key,
    required this.genreId,
  });

  @override
  State<DisplayOptions> createState() => _DisplayOptionsState();
}

class _DisplayOptionsState extends State<DisplayOptions> {
  int selectedIndex = 0;

  final GenreGamesBloc _bloc = GenreGamesBloc(
    genreGamesRepository: GenreGamesRepository(
      genreGamesRemoteDataSource: GenreGamesRemoteDataSource(),
    ),
  );
  late StreamSubscription<GenreGamesState> _blocListingStateSubscription;

  final PagingController<int, GenreGameModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _bloc.onPageRequestSink.add(
        GenrePageModel(
          page: pageKey,
          id: widget.genreId,
        ),
      );
    });

    _blocListingStateSubscription =
        _bloc.onNewListingState.listen((listingState) {
      _pagingController.value = PagingState(
        nextPageKey: listingState.page,
        error: listingState.error,
        itemList: listingState.genreGames,
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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DisplayPicker(
            callback: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
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
                builderDelegate: PagedChildBuilderDelegate<GenreGameModel>(
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
                builderDelegate: PagedChildBuilderDelegate<GenreGameModel>(
                  itemBuilder: (context, item, index) => ListViewTile(
                    name: item.name,
                    popularity: item.popularity,
                    gameId: item.gameId,
                    url: item.url,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
