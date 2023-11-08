// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:nil/nil.dart';

// Project imports:
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genre_games/presentation/widgets/display_picker.dart';
import 'package:gameon/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:gameon/features/search/presentation/widgets/search_outcome.dart';
import 'package:gameon/utils/custom_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _gamesVisible = false;
  String _text = '';
  int _selectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.theme.colorScheme.background,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              elevation: 5,
              backgroundColor: CustomTheme.theme.colorScheme.onBackground,
              collapsedHeight: 70,
              title: CustomSearchBar(
                controller: _controller,
                onTextFieldChanged: (textValue) {
                  setState(() {
                    _text = textValue;
                    _gamesVisible = false;
                  });
                },
                onIconTap: () {
                  _controller.clear();
                  setState(() {
                    _gamesVisible = true;
                  });
                },
                onTextFieldSubmitted: () {
                  _controller.clear();
                  setState(() {
                    _gamesVisible = true;
                  });
                },
              ),
              actions: [
                const DataProviderButton(),
              ],
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(_gamesVisible ? 60 : 0),
                child: _gamesVisible
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: DisplayPicker(
                          callback: (value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
                          selectedIndex: _selectedIndex,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ];
        },
        body: _gamesVisible
            ? SearchOutcome(
                searchQuery: _text,
                selectedIndex: _selectedIndex,
              )
            : nil,
      ),
    );
  }
}
