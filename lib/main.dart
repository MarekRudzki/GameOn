import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/home_page.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:gameon/utils/di.dart';

void main() async {
  await dotenv.load();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<GenresBloc>(
              create: (context) => getIt<GenresBloc>()..add(GenresRequested()),
            ),
            BlocProvider<GenreGamesBloc>(
              create: (context) => getIt<GenreGamesBloc>(),
            ),
            BlocProvider<GameDetailsBloc>(
              create: (context) => getIt<GameDetailsBloc>(),
            ),
            BlocProvider<SearchBloc>(
              create: (context) => getIt<SearchBloc>(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
        ),
      );
    },
  );
}
