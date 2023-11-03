import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gameon/features/game_details_screen/data/datasources/game_details_remote_data_source.dart';
import 'package:gameon/features/game_details_screen/domain/repositories/game_details_repository.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/genre_games/data/datasources/genre_games_remote_data_source.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genres/data/datasources/genres_remote_data_source.dart';
import 'package:gameon/features/genres/domain/repositories/genres_repository.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/home_page.dart';
import 'package:gameon/features/search/data/datasources/search_remote_data_source.dart';
import 'package:gameon/features/search/domain/repositories/search_repository.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';

void main() async {
  await dotenv.load();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GenresBloc>(
          create: (context) => GenresBloc(
              genresRepository: GenresRepository(
            genresRemoteDataSource: GenresRemoteDataSource(),
          ))
            ..add(GenresRequested()),
        ),
        BlocProvider<GenreGamesBloc>(
          create: (context) => GenreGamesBloc(
              genreGamesRepository: GenreGamesRepository(
            genreGamesRemoteDataSource: GenreGamesRemoteDataSource(),
          )),
        ),
        BlocProvider(
          create: (context) => GameDetailsBloc(
            gameDetailsRepository: GameDetailsRepository(
              gameDetailsRemoteDataSource: GameDetailsRemoteDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            searchRepository: SearchRepository(
              searchRemoteDataSource: SearchRemoteDataSource(),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
