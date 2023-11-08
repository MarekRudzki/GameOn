// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/common_widgets/paged_view_no_item_found.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';
import 'package:gameon/utils/custom_theme.dart';
import 'package:gameon/utils/di.dart';

class GenreGamesScreen extends StatefulWidget {
  final int genreId;
  final String name;

  const GenreGamesScreen({
    super.key,
    required this.genreId,
    required this.name,
  });

  @override
  State<GenreGamesScreen> createState() => _GenreGamesScreenState();
}

class _GenreGamesScreenState extends State<GenreGamesScreen> {
  int _selectedIndex = 0;

  final GenreGamesBloc _bloc = getIt<GenreGamesBloc>();

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
    final bool _hasInternet =
        context.watch<InternetConnectionProvider>().hasInternet;

    return SafeArea(
      child: _hasInternet
          ? Scaffold(
              backgroundColor: CustomTheme.theme.colorScheme.background,
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return [
                    SliverAppBar(
                      elevation: 5,
                      backgroundColor:
                          CustomTheme.theme.colorScheme.onBackground,
                      title: Text(
                        widget.name,
                        style: TextStyle(
                          color: CustomTheme.theme.colorScheme.primary,
                          fontSize: 21,
                        ),
                      ),
                      centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: CustomTheme.theme.colorScheme.primary,
                        ),
                      ),
                      actions: [
                        const DataProviderButton(),
                      ],
                      forceElevated: innerBoxIsScrolled,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: DisplayPicker(
                              callback: (value) {
                                setState(() {
                                  _selectedIndex = value;
                                });
                              },
                              selectedIndex: _selectedIndex,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: _selectedIndex == 0
                    ? PagedGridView(
                        showNewPageProgressIndicatorAsGridChild: false,
                        pagingController: _pagingController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1 / 1.1,
                        ),
                        builderDelegate:
                            PagedChildBuilderDelegate<GenreGameModel>(
                          noItemsFoundIndicatorBuilder: (context) =>
                              const PagedViewNoItemFound(
                                  text: 'Try restarting the page'),
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
                        builderDelegate:
                            PagedChildBuilderDelegate<GenreGameModel>(
                          noItemsFoundIndicatorBuilder: (context) =>
                              const PagedViewNoItemFound(
                                  text: 'Try restarting the page'),
                          itemBuilder: (context, item, index) => ListViewTile(
                            name: item.name,
                            popularity: item.popularity,
                            gameId: item.gameId,
                            url: item.url,
                          ),
                        ),
                      ),
              ),
            )
          : const NoNetwork(),
    );
  }
}
