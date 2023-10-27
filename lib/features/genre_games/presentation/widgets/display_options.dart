import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games/genre_games_bloc.dart';
import 'package:gameon/features/genre_games/presentation/widgets/games_gridview.dart';
import 'package:gameon/features/genre_games/presentation/widgets/games_listview.dart';

class DisplayOptions extends StatefulWidget {
  const DisplayOptions({super.key});

  @override
  State<DisplayOptions> createState() => _DisplayOptionsState();
}

class _DisplayOptionsState extends State<DisplayOptions> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                color: const Color.fromARGB(255, 58, 57, 65),
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
        BlocBuilder<GenreGamesBloc, GenreGamesState>(
          builder: (context, state) {
            if (state is GenreGamesSuccess) {
              if (selectedIndex == 0) {
                return GamesGridView(gamesList: state.genreGames);
              } else {
                return GamesListView(gamesList: state.genreGames);
              }
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
    );
  }
}
