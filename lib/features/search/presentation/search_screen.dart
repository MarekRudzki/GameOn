import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/search/presentation/widgets/search_bar.dart';
import 'package:gameon/features/search/presentation/widgets/search_outcome.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool gamesVisible = false;
  String text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 15, 47, 91),
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
        backgroundColor: const Color.fromARGB(255, 2, 31, 68),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSearchBar(
                controller: _controller,
                onTextFieldChanged: (textValue) {
                  setState(() {
                    text = textValue;
                    gamesVisible = false;
                  });
                },
                onIconTap: () {
                  _controller.clear();
                  setState(() {
                    gamesVisible = true;
                  });
                },
                onTextFieldSubmitted: () {
                  _controller.clear();
                  setState(() {
                    gamesVisible = true;
                  });
                },
              ),
              const SizedBox(height: 10),
              if (gamesVisible)
                SearchOutcome(searchQuery: text)
              else
                const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
