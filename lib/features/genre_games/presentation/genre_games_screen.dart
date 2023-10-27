import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_options.dart';

class GenreGamesScreen extends StatelessWidget {
  final int genreId;
  final String name;

  const GenreGamesScreen({
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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: DisplayOptions(),
          ),
        ),
      ),
    );
  }
}
