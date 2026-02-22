// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gameon/features/internet_connection/presentation/bloc/internet_connection_bloc.dart';
import 'package:gameon/features/internet_connection/presentation/widgets/network_listener_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Project imports:
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/home_page.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/config/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await _initializeApp();
    runApp(const GameOnApp());
  } catch (e) {
    runApp(ErrorApp(error: e.toString()));
  }
}

Future<void> _initializeApp() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await dotenv.load();
  await Hive.initFlutter();
  await Hive.openBox('favorites');

  configureDependencies();
}

class GameOnApp extends StatelessWidget {
  const GameOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectionBloc>(
          create: (context) =>
              InternetConnectionBloc(connectionChecker: InternetConnectionChecker.instance)
                ..add(const InternetConnectionStarted()),
        ),
        BlocProvider<GenresBloc>(create: (context) => getIt<GenresBloc>()..add(GenresRequested())),
        BlocProvider<GenreGamesBloc>(create: (context) => getIt<GenreGamesBloc>()),
        BlocProvider<GameDetailsBloc>(create: (context) => getIt<GameDetailsBloc>()),
        BlocProvider<SearchBloc>(create: (context) => getIt<SearchBloc>()),
        BlocProvider<FavoritesBloc>(create: (context) => getIt<FavoritesBloc>()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return NetworkListenerWidget(child: child!);
        },
        theme: CustomTheme.theme,
        color: CustomTheme.theme.colorScheme.onSurface,
        debugShowCheckedModeBanner: false,
        title: 'GameOn',
        home: const HomePage(),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  final String error;

  const ErrorApp({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('App initialization error:\n$error'))),
    );
  }
}
