import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/game_details_screen.dart';

class GridViewTile extends StatelessWidget {
  final String name;
  final String url;
  final int gameId;

  final int popularity;

  const GridViewTile({
    super.key,
    required this.name,
    required this.url,
    required this.popularity,
    required this.gameId,
  });

  @override
  Widget build(BuildContext context) {
    final String heroId = '${gameId}_grid';
    ImageProvider? loadedImage;

    return InkWell(
      onTap: () {
        context.read<GameDetailsBloc>().add(
              GameDetailsRequested(gameId: gameId),
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameDetailsScreen(
              image: loadedImage ?? CachedNetworkImageProvider(url),
              name: name,
              id: gameId,
              heroId: heroId,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => Image.asset(
              'assets/loading.gif',
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 80,
              color: Colors.red,
            ),
            imageBuilder: (context, imageProvider) {
              loadedImage = imageProvider;
              return Column(
                children: [
                  Hero(
                    tag: heroId,
                    child: Container(
                      height: (MediaQuery.of(context).size.height) / 7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: const Color.fromARGB(255, 27, 62, 110),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$popularity',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Image.asset(
                                'assets/rating_stars.png',
                                height: 35,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
