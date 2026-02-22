// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/core/network/presentation/bloc/internet_connection_bloc.dart';
import 'package:gameon/features/favorites/presentation/favorites_screen.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/genres/presentation/genres_screen.dart';
import 'package:gameon/features/home_page/presentation/widgets/icons.dart';
import 'package:gameon/features/home_page/presentation/widgets/on_will_pop_alert_dialog.dart';
import 'package:gameon/features/search/presentation/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = const [GenresScreen(), SearchScreen(), FavoritesScreen()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<InternetConnectionBloc>().state;
      final hasInternet = state is InternetConnectionConnected;

      if (hasInternet) {
        context.read<GenresBloc>().add(GenresRequested());
      }
    });
  }

  Future<void> _handleBackPress(BuildContext context) async {
    final bool? exitResult = await showDialog<bool>(
      context: context,
      builder: (context) => const OnWillPopAlertDialog(),
    );

    if (exitResult == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _handleBackPress(context),
      child: SafeArea(
        child: Scaffold(
          body: _pages[_index],
          bottomNavigationBar: _BottomNavigationBar(
            selectedIndex: _index,
            onTabChange: (index) => setState(() => _index = index),
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const _BottomNavigationBar({required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      haptic: false,
      selectedIndex: selectedIndex,
      onTabChange: onTabChange,
      gap: 10,
      backgroundColor: CustomTheme.theme.colorScheme.onSurface,
      color: CustomTheme.theme.colorScheme.primary,
      activeColor: CustomTheme.theme.colorScheme.secondary,
      padding: const EdgeInsets.all(16),
      tabs: const [
        GButton(icon: MyIcons.gamepad, text: 'Games'),
        GButton(icon: Icons.search, text: 'Search'),
        GButton(icon: Icons.favorite, text: 'Favorites'),
      ],
    );
  }
}
