import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/home_page.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:gameon/utils/di.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(
        ChangeNotifierProvider<InternetConnectionProvider>(
          create: (context) => InternetConnectionProvider(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<GenresBloc>(
                create: (context) =>
                    getIt<GenresBloc>()..add(GenresRequested()),
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
              BlocProvider<FavoritesBloc>(
                create: (context) => getIt<FavoritesBloc>(),
              ),
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'GameOn',
              home: HomePage(),
            ),
          ),
        ),
      );
    },
  );
}
