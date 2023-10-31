import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/custom_sliver_app_bar.dart';

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
            CustomSliverAppBar(
              name: name,
              heroId: heroId,
              image: image,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<GameDetailsBloc, GameDetailsState>(
                      builder: (context, state) {
                    if (state is GameDetailsSuccess) {
                      return Column(
                        children: [
                          const Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            height: 1500,
                          )
                        ],
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
