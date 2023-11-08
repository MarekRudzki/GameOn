// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

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
                    Text(
                      'Developer',
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.scrim,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      developers,
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
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
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      esrbRating,
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
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
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      playtime == 0 ? 'No data' : '${playtime} h',
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
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
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      metacritic == 0 ? 'No data' : metacritic.toString(),
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
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
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      released,
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
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
