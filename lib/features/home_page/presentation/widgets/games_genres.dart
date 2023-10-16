import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/games_genres/presentation/bloc/games_genres/games_genres_bloc.dart';

class GamesGenres extends StatelessWidget {
  const GamesGenres({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> gamesGenres = [
      'All',
      'Action',
      'Adventure',
      'Platformer',
      'Puzzle',
      'Simulation',
      'Shooter',
      'Indie',
      'Strategy',
      'RPG',
      'Casual',
      'Racing',
      'Arcade',
      'Sports',
      'Educational',
      'Fighting',
      'Board',
      'Family',
      'Card',
      'MMO',
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
      child: Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: gamesGenres.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context
                  .read<GamesGenresBloc>()
                  .add(GameGenreChanged(genre: gamesGenres[index]));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 39, 60, 223),
                      Color.fromARGB(255, 125, 20, 112),
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    stops: [0.0, 0.75],
                  ),
                ),
                width: 80 + (gamesGenres[index].length * 3),
                height: 40,
                child: Center(
                  child: Text(
                    gamesGenres[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
