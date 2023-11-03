import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/available_platforms.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_description.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_screenshots.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/overall_game_info.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/user_rating.dart';

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
        backgroundColor: const Color.fromARGB(255, 2, 31, 68),
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
                        return Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OverallGameInfo(
                                developers: state.gameDetails.developers,
                                metacritic: state.gameDetails.metacritic,
                                playtime: state.gameDetails.playtime,
                                released: state.gameDetails.released,
                                esrbRating: state.gameDetails.esrbRating,
                              ),
                              if (state.gameDetails.reviewsCount == 0)
                                const SizedBox.shrink()
                              else
                                UserRating(
                                  reviewsCount: state.gameDetails.reviewsCount,
                                  userRating: state.gameDetails.userRating,
                                ),
                              AvailablePlatforms(
                                platforms: state.gameDetails.platforms,
                              ),
                              GameDescription(
                                description: state.gameDetails.description,
                              ),
                              if (state.gameDetails.screenshots == ['No Data'])
                                const SizedBox.shrink()
                              else
                                GameScreenshots(
                                  screenshots: state.gameDetails.screenshots,
                                ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          height: 200,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
