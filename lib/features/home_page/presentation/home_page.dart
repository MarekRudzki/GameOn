import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameon/features/favorites/presentation/favorites.dart';
import 'package:gameon/features/home_page/presentation/widgets/icons.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';
import 'package:gameon/features/genres/presentation/genres_screen.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';
import 'package:gameon/features/search/presentation/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<InternetConnectionStatus> _internetSubscription;
  bool hasInternet = true;
  int index = 0;

  final List<Widget> pages = [
    const GenresScreen(),
    const Search(),
    const Favorites(),
  ];

  @override
  void initState() {
    super.initState();
    _internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        setState(() {
          hasInternet = false;
        });
      } else {
        setState(() {
          hasInternet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _internetSubscription.cancel();
    super.dispose();
  }

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
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              pages[index],
              if (!hasInternet) const NoNetwork(),
            ],
          ),
          bottomNavigationBar: GNav(
            gap: 10,
            backgroundColor: const Color.fromARGB(255, 58, 57, 65),
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
        ),
      ),
    );
  }
}
