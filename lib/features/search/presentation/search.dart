import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 58, 57, 65),
          title: const Text(
            'Search',
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
        backgroundColor: const Color.fromARGB(255, 43, 42, 48),
        body: Container(),
      ),
    );
  }
}
