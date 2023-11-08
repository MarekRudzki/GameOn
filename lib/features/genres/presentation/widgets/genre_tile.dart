// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:gameon/features/genre_games/presentation/genre_games_screen.dart';
import 'package:gameon/utils/custom_theme.dart';

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
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: const Color.fromARGB(255, 27, 62, 110),
                      child: Center(
                        child: Text(
                          genreName.replaceAll('Massively Multiplayer', 'MMO'),
                          style: TextStyle(
                            fontSize: 17,
                            color: CustomTheme.theme.colorScheme.primary,
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
