import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/available_platforms.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_description.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_screenshots.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/overall_game_info.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/user_rating.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';

class GameDetailsScreen extends StatelessWidget {
  final ImageProvider? image;
  final String name;
  final int id;
  final String heroId;
  final String url;
  final int popularity;

  const GameDetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.heroId,
    required this.url,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final hasPhoto = image != null;
    final bool hasInternet =
        context.watch<InternetConnectionProvider>().hasInternet;

    return SafeArea(
      child: hasInternet
          ? Scaffold(
              appBar: !hasPhoto
                  ? AppBar(
                      backgroundColor: const Color.fromARGB(255, 15, 47, 91),
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          final double appBarHeight =
                              constraints.biggest.height;
                          final bool isExpanded = appBarHeight > height * 0.1;
                          return FlexibleSpaceBar(
                            expandedTitleScale: 1.3,
                            centerTitle: true,
                            titlePadding: EdgeInsets.symmetric(
                              horizontal: 45,
                              vertical: isExpanded ? 10 : 0,
                            ),
                            title: Column(
                              mainAxisAlignment: isExpanded
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.center,
                              children: [
                                Container(),
                                GlowText(
                                  name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                  textAlign: TextAlign.center,
                                  glowColor: Colors.black,
                                  blurRadius: 10,
                                  softWrap: true,
                                  maxLines: isExpanded ? 3 : 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Container(),
                              ],
                            ),
                          );
                        },
                      ),
                      actions: [
                        const DataProviderButton(),
                      ],
                    )
                  : null,
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 2, 28, 61),
                      Color.fromARGB(255, 31, 71, 126),
                    ],
                  ),
                ),
                child: CustomScrollView(
                  slivers: [
                    if (hasPhoto)
                      CustomSliverAppBar(
                        name: name,
                        heroId: heroId,
                        image: image!,
                        url: url,
                        popularity: popularity,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OverallGameInfo(
                                        developers:
                                            state.gameDetails.developers,
                                        metacritic:
                                            state.gameDetails.metacritic,
                                        playtime: state.gameDetails.playtime,
                                        released: state.gameDetails.released,
                                        esrbRating:
                                            state.gameDetails.esrbRating,
                                      ),
                                      if (state.gameDetails.reviewsCount == 0)
                                        const SizedBox.shrink()
                                      else
                                        UserRating(
                                          reviewsCount:
                                              state.gameDetails.reviewsCount,
                                          userRating:
                                              state.gameDetails.userRating,
                                        ),
                                      AvailablePlatforms(
                                        platforms: state.gameDetails.platforms,
                                      ),
                                      GameDescription(
                                        description:
                                            state.gameDetails.description,
                                      ),
                                      if (state.gameDetails.screenshots ==
                                          ['No Data'])
                                        const SizedBox.shrink()
                                      else
                                        GameScreenshots(
                                          screenshots:
                                              state.gameDetails.screenshots,
                                        ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
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
            )
          : const NoNetwork(),
    );
  }
}
