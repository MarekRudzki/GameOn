import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';

class GenreDetails extends StatelessWidget {
  final int genreId;
  final String name;

  const GenreDetails({
    super.key,
    required this.genreId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 43, 42, 48),
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
          child: Column(),
        ),
      ),
    );
  }
}
