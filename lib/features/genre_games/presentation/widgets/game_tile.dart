import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class GameTile extends StatelessWidget {
  final String gameName;
  final double rating;
  final String url;
  const GameTile({
    super.key,
    required this.gameName,
    required this.rating,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 32, 30),
                Color.fromARGB(255, 49, 49, 51),
              ],
            ),
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
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) => Image.asset(
                          'assets/loading.gif',
                          fit: BoxFit.fill,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 100,
                          color: Colors.red,
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
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
                          gameName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingStars(
                        value: rating,
                        valueLabelColor: Colors.transparent,
                        maxValueVisibility: false,
                        starSize: 13,
                      ),
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
