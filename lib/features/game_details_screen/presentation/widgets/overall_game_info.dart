import 'package:flutter/material.dart';

class OverallGameInfo extends StatelessWidget {
  final String developers;
  final int metacritic;
  final int playtime;
  final String released;
  final String esrbRating;

  const OverallGameInfo({
    super.key,
    required this.developers,
    required this.metacritic,
    required this.playtime,
    required this.released,
    required this.esrbRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      developers,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Color.fromARGB(255, 127, 124, 124),
                  thickness: 1,
                ),
                Column(
                  children: [
                    const Text(
                      'ESRB rating',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      esrbRating,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Average playtime',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      playtime == 0 ? 'No data' : '${playtime} h',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Color.fromARGB(255, 127, 124, 124),
                  thickness: 1,
                ),
                Column(
                  children: [
                    const Text(
                      'Metacritic',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      metacritic == 0 ? 'No data' : metacritic.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Color.fromARGB(255, 127, 124, 124),
                  thickness: 1,
                ),
                Column(
                  children: [
                    const Text(
                      'Released',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      released,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}