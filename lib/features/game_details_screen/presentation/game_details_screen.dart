import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';

class GameDetailsScreen extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final int id;
  final String heroId;

  const GameDetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.heroId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 43, 42, 48),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 58, 57, 65),
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                background: Hero(
                  tag: heroId,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                const DataProviderButton(),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<GameDetailsBloc, GameDetailsState>(
                      builder: (context, state) {
                    if (state is GameDetailsSuccess) {
                      return Container(
                        width: 100,
                        height: 1000,
                        color: Colors.red,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
