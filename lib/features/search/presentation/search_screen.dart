import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/search/data/models/search_page_model.dart';
import 'package:gameon/features/search/presentation/bloc/search_bloc/search_bloc.dart';
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
    final searchTextFieldWidth = MediaQuery.of(context).size.width * 0.7;
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
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 27, 62, 110),
                    width: 7,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: searchTextFieldWidth,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            text = value;
                            gamesVisible = false;
                          });
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search for a game...',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 27, 62, 110),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        onSubmitted: (value) {
                          context.read<SearchBloc>().onPageRequestSink.add(
                                SearchPageModel(
                                  page: 1,
                                  searchQuery: value,
                                ),
                              );
                          _controller.clear();
                          setState(() {
                            gamesVisible = true;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<SearchBloc>().onPageRequestSink.add(
                                SearchPageModel(
                                  page: 1,
                                  searchQuery: _controller.text,
                                ),
                              );
                          FocusScope.of(context).unfocus();
                          _controller.clear();
                          setState(() {
                            gamesVisible = true;
                          });
                        },
                        child: Container(
                          height: 60,
                          color: const Color.fromARGB(255, 27, 62, 110),
                          child: const Icon(
                            Icons.search,
                            color: Colors.pinkAccent,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
