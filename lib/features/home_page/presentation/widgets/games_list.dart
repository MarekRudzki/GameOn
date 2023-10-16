import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class GamesList extends StatelessWidget {
  const GamesList({super.key});

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['RAWG_Key'];

    return FutureBuilder(
      future:
          Dio().get('https://api.rawg.io/api/games/cyberpunk-2077?key=$apiKey'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: 100,
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
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        snapshot.data!.data['background_image'] as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          snapshot.data!.data['name'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        RatingStars(
                          value: snapshot.data!.data['rating'] as double,
                          starSize: 13,
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  // const Icon(
                  //   Icons.arrow_forward,
                  //   color: Colors.white,
                  //   size: 30,
                  // ),
                  // const SizedBox(width: 20)
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
