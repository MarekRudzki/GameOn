import 'package:flutter/material.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/search/presentation/widgets/custom_search_bar.dart';
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
  int selectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 31, 68),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              elevation: 5,
              backgroundColor: const Color.fromARGB(255, 15, 47, 91),
              collapsedHeight: 70,
              title: CustomSearchBar(
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
              actions: [
                const DataProviderButton(),
              ],
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(gamesVisible ? 60 : 0),
                child: gamesVisible
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: DisplayPicker(
                          callback: (value) {
                            setState(() {
                              selectedIndex = value;
                            });
                          },
                          selectedIndex: selectedIndex,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ];
        },
        body: gamesVisible
            ? SearchOutcome(
                searchQuery: text,
                selectedIndex: selectedIndex,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
