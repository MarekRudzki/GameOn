// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';

// Project imports:
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/available_platforms.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_description.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/game_screenshots.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/overall_game_info.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/user_rating.dart';
import 'package:gameon/features/home_page/presentation/provider/internet_connection_provider.dart';
import 'package:gameon/features/home_page/presentation/widgets/no_network.dart';
import 'package:gameon/utils/custom_theme.dart';

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
    final double _height = MediaQuery.sizeOf(context).height;
    final bool _hasPhoto = image != null;
    final bool _hasInternet =
        context.watch<InternetConnectionProvider>().hasInternet;

    return WillPopScope(
      onWillPop: () async {
        context.read<FavoritesBloc>().add(FavoritesRequested());
        Navigator.of(context).pop();
        return true;
      },
      child: SafeArea(
        child: _hasInternet
            ? Scaffold(
                appBar: !_hasPhoto
                    ? AppBar(
                        backgroundColor:
                            CustomTheme.theme.colorScheme.onBackground,
                        flexibleSpace: LayoutBuilder(
                          builder: (context, constraints) {
                            final double _appBarHeight =
                                constraints.biggest.height;
                            final bool _isExpanded =
                                _appBarHeight > _height * 0.1;
                            return FlexibleSpaceBar(
                              expandedTitleScale: 1.3,
                              centerTitle: true,
                              titlePadding: EdgeInsets.symmetric(
                                horizontal: 45,
                                vertical: _isExpanded ? 10 : 0,
                              ),
                              title: Column(
                                mainAxisAlignment: _isExpanded
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.center,
                                children: [
                                  Container(),
                                  GlowText(
                                    name,
                                    style: TextStyle(
                                      color:
                                          CustomTheme.theme.colorScheme.primary,
                                      fontSize: 21,
                                    ),
                                    textAlign: TextAlign.center,
                                    glowColor:
                                        CustomTheme.theme.colorScheme.tertiary,
                                    blurRadius: 10,
                                    softWrap: true,
                                    maxLines: _isExpanded ? 3 : 2,
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
                      if (_hasPhoto)
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
                                          platforms:
                                              state.gameDetails.platforms,
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
      ),
    );
  }
}
