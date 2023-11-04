import 'package:flutter/material.dart';
import 'package:gameon/features/favorites/presentation/favorites.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/icons.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';
import 'package:gameon/features/genres/presentation/genres_screen.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';
import 'package:gameon/features/search/presentation/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final List<Widget> pages = [
    const GenresScreen(),
    const SearchScreen(),
    const Favorites(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool hasInternet =
        context.watch<InternetConnectionProvider>().hasInternet;

    if (hasInternet) {
      context.read<GenresBloc>().add(GenresRequested());
    }

    return WillPopScope(
      onWillPop: () async {
        final bool? exitResult = await showDialog(
          context: context,
          builder: (context) => const OnWillPopAlertDialog(),
        );
        return exitResult ?? false;
      },
      child: SafeArea(
        child: hasInternet
            ? Scaffold(
                body: pages[index],
                bottomNavigationBar: GNav(
                  selectedIndex: index,
                  gap: 10,
                  backgroundColor: const Color.fromARGB(255, 15, 47, 91),
                  color: Colors.white,
                  activeColor: Colors.pinkAccent,
                  padding: const EdgeInsets.all(16),
                  tabs: [
                    GButton(
                      icon: MyIcons.gamepad,
                      text: 'Games',
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.favorite,
                      text: 'Favorites',
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                    ),
                  ],
                ),
              )
            : const NoNetwork(),
      ),
    );
  }
}
