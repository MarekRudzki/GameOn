import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games/genre_games_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_options.dart';
import 'package:gameon/features/genre_games/presentation/widgets/game_tile.dart';

class GenreGames extends StatelessWidget {
  final int genreId;
  final String name;

  const GenreGames({
    super.key,
    required this.genreId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 58, 57, 65),
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          actions: [
            const DataProviderButton(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 43, 42, 48),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Display options:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      DisplayOptions(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<GenreGamesBloc, GenreGamesState>(
                  builder: (context, state) {
                    if (state is GenreGamesSuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.genreGames.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GameTile(
                          gameName: state.genreGames[index].name,
                          rating: state.genreGames[index].rating,
                          url: state.genreGames[index].url,
                        ),
                      );
                    } else if (state is GenreGamesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
