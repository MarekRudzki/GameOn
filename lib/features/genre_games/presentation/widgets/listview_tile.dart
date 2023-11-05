import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/game_details_screen.dart';

class ListViewTile extends StatelessWidget {
  final String name;
  final int gameId;
  final String url;
  final int popularity;

  const ListViewTile({
    super.key,
    required this.name,
    required this.url,
    required this.popularity,
    required this.gameId,
  });

  @override
  Widget build(BuildContext context) {
    final String heroId = '${gameId}_list';
    ImageProvider? loadedImage;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: () {
          context.read<GameDetailsBloc>().add(
                GameDetailsRequested(gameId: gameId),
              );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameDetailsScreen(
                image: loadedImage != null
                    ? CachedNetworkImageProvider(url)
                    : null,
                name: name,
                id: gameId,
                heroId: heroId,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 27, 62, 110),
            boxShadow: [
              const BoxShadow(
                offset: Offset(0.0, 1.0),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: url != 'No data'
                          ? CachedNetworkImage(
                              imageUrl: url,
                              placeholder: (context, url) => Hero(
                                tag: gameId,
                                child: Image.asset(
                                  'assets/loading.gif',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              imageBuilder: (context, imageProvider) {
                                loadedImage = imageProvider;

                                return Hero(
                                  tag: heroId,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              height: MediaQuery.sizeOf(context).height * 0.12,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Photo not available',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 5),
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
          ),
        ),
      ),
    );
  }
}
