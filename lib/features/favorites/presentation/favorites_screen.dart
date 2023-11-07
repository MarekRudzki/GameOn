import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/genre_games/presentation/widgets/gridview_tile.dart';
import 'package:gameon/features/genre_games/presentation/widgets/listview_tile.dart';
import 'package:gameon/utils/custom_theme.dart';
import 'package:nil/nil.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(FavoritesRequested());

    return Scaffold(
      backgroundColor: CustomTheme.theme.colorScheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              elevation: 5,
              backgroundColor: CustomTheme.theme.colorScheme.onBackground,
              collapsedHeight: 70,
              title: Text(
                'Favorites',
                style: TextStyle(
                  color: CustomTheme.theme.colorScheme.primary,
                  fontSize: 21,
                ),
              ),
              centerTitle: true,
              actions: [
                const DataProviderButton(),
              ],
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
          ];
        },
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoaded) {
              if (state.favoriteGames.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
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
                    )
                  ],
                );
              } else {
                return _selectedIndex == 0
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1 / 1.1,
                        ),
                        itemCount: state.favoriteGames.length,
                        itemBuilder: (context, index) => GridViewTile(
                          name: state.favoriteGames[index].name,
                          url: state.favoriteGames[index].url,
                          gameId: state.favoriteGames[index].gameId,
                          popularity: state.favoriteGames[index].popularity,
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.favoriteGames.length,
                        itemBuilder: (context, index) => ListViewTile(
                          name: state.favoriteGames[index].name,
                          url: state.favoriteGames[index].url,
                          gameId: state.favoriteGames[index].gameId,
                          popularity: state.favoriteGames[index].popularity,
                        ),
                      );
              }
            } else {
              return nil;
            }
          },
        ),
      ),
    );
  }
}
