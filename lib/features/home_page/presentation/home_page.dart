// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:gameon/features/favorites/presentation/favorites_screen.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/genres/presentation/genres_screen.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/icons.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';
import 'package:gameon/features/search/presentation/search_screen.dart';
import 'package:gameon/config/theme/custom_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = [const GenresScreen(), const SearchScreen(), const FavoritesScreen()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool hasInternet = context.watch<InternetConnectionProvider>().hasInternet;

      if (hasInternet) {
        context.read<GenresBloc>().add(GenresRequested());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;

        final bool? exitResult = await showDialog<bool>(
          context: context,
          builder: (context) => const OnWillPopAlertDialog(),
        );

        if (exitResult == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _pages[_index],
          bottomNavigationBar: GNav(
            haptic: false,
            selectedIndex: _index,
            gap: 10,
            backgroundColor: CustomTheme.theme.colorScheme.onSurface,
            color: CustomTheme.theme.colorScheme.primary,
            activeColor: CustomTheme.theme.colorScheme.secondary,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: MyIcons.gamepad,
                text: 'Games',
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorites',
                onPressed: () {
                  setState(() {
                    _index = 2;
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
