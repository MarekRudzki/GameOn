import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gameon/features/games_genres/presentation/bloc/games_genres/games_genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/home_page.dart';

void main() async {
  await dotenv.load();
  runApp(
    BlocProvider(
      create: (context) => GamesGenresBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
