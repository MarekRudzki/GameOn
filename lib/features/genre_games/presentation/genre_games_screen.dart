import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_options.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';
import 'package:provider/provider.dart';

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
    final bool hasInternet =
        context.watch<InternetConnectionProvider>().hasInternet;
    return SafeArea(
      child: hasInternet
          ? Scaffold(
              appBar: AppBar(
                elevation: 5,
                backgroundColor: const Color.fromARGB(255, 15, 47, 91),
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
              backgroundColor: const Color.fromARGB(255, 2, 31, 68),
              body: DisplayOptions(
                genreId: genreId,
              ),
            )
          : const NoNetwork(),
    );
  }
}
