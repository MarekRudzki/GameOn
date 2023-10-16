import 'package:flutter/material.dart';
import 'package:gameon/features/home_page/presentation/widgets/data_provider_button.dart';
import 'package:gameon/features/home_page/presentation/widgets/games_genres.dart';
import 'package:gameon/features/home_page/presentation/widgets/games_list.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool? exitResult = await showDialog(
          context: context,
          builder: (context) => const OnWillPopAlertDialog(),
        );
        return exitResult ?? false;
      },
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 43, 42, 48),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        'Games',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                      Spacer(),
                      DataProviderButton()
                    ],
                  ),
                  GamesGenres(),
                  GamesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
