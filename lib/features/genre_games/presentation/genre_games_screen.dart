import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_options.dart';

class GenreGamesScreen extends StatefulWidget {
  final int genreId;
  final String name;

  const GenreGamesScreen({
    super.key,
    required this.genreId,
    required this.name,
  });

  @override
  State<GenreGamesScreen> createState() => _GenreGamesScreenState();
}

class _GenreGamesScreenState extends State<GenreGamesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 15, 47, 91),
          title: Text(
            widget.name,
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
        backgroundColor: const Color.fromARGB(255, 2, 31, 68),
        body: DisplayOptions(
          genreId: widget.genreId,
        ),
      ),
    );
  }
}
