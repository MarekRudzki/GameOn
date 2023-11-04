import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 15, 47, 91),
          title: const Text(
            'Favorites',
            style: TextStyle(
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
        body: const Placeholder(),
      ),
    );
  }
}
