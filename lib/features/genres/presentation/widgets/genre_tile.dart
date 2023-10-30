import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/genre_games/data/models/genre_page_model.dart';
import 'package:gameon/features/genre_games/presentation/bloc/genre_games/genre_games_bloc.dart';
import 'package:gameon/features/genre_games/presentation/genre_games_screen.dart';

class GenreTile extends StatelessWidget {
  const GenreTile({
    super.key,
    required this.genreId,
    required this.genreName,
    required this.genreUrl,
  });

  final int genreId;
  final String genreName;
  final String genreUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GenreGamesBloc>().onPageRequestSink.add(
              GenrePageModel(
                page: 1,
                id: genreId,
              ),
            );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GenreGamesScreen(
              genreId: genreId,
              name: genreName,
            ),
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: genreUrl,
              placeholder: (context, url) => Image.asset(
                'assets/loading.gif',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 80,
                color: Colors.red,
              ),
              imageBuilder: (context, imageProvider) => Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height) / 7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(192, 105, 103, 103),
                      child: Center(
                        child: Text(
                          genreName.replaceAll('Massively Multiplayer', 'MMO'),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
