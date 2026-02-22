// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/favorites/data/models/favorite_game_model.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:gameon/config/theme/custom_theme.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<FavoritesBloc>().add(FavoritesRequested());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomTheme.theme.colorScheme.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 5,
            backgroundColor: CustomTheme.theme.colorScheme.onSurface,
            collapsedHeight: 70,
            title: Text(
              'Favorites',
              style: TextStyle(
                color: CustomTheme.theme.colorScheme.primary,
                fontSize: 21,
              ),
            ),
            centerTitle: true,
            actions: const [DataProviderButton()],
            forceElevated: innerBoxIsScrolled,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: DisplayPicker(
                  callback: (value) => setState(() => _selectedIndex = value),
                  selectedIndex: _selectedIndex,
                ),
              ),
            ),
          ),
        ],
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return switch (state) {
              FavoritesLoaded() => _buildLoadedState(state),
              FavoritesLoading() => const Center(child: CircularProgressIndicator()),
              FavoritesError() => _buildErrorState(state.message),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildLoadedState(FavoritesLoaded state) {
    if (state.favoriteGames.isEmpty) {
      return _buildEmptyState();
    }

    return _selectedIndex == 0
        ? _buildGridView(state.favoriteGames)
        : _buildListView(state.favoriteGames);
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text(
          'No favorite games found',
          style: TextStyle(
            fontSize: 18,
            color: CustomTheme.theme.colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Try add some!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: CustomTheme.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(List<FavoriteGameModel> games) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 1 / 1.1,
      ),
      itemCount: games.length,
      itemBuilder: (context, index) => GridViewTile(
        name: games[index].name,
        url: games[index].url,
        gameId: games[index].gameId,
        popularity: games[index].popularity,
      ),
    );
  }

  Widget _buildListView(List<FavoriteGameModel> games) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) => ListViewTile(
        name: games[index].name,
        url: games[index].url,
        gameId: games[index].gameId,
        popularity: games[index].popularity,
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: CustomTheme.theme.colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading favorites',
            style: TextStyle(
              fontSize: 18,
              color: CustomTheme.theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: CustomTheme.theme.colorScheme.primary.withAlpha(179),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
