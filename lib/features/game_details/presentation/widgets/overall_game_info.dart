// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
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
                      l10n.developer,
                      style: TextStyle(color: CustomTheme.theme.colorScheme.scrim),
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
                const VerticalDivider(color: Color.fromARGB(255, 127, 124, 124), thickness: 1),
                Column(
                  children: [
                    Text(
                      l10n.esrbRating,
                      style: TextStyle(color: Color.fromARGB(255, 197, 194, 194)),
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
                    Text(
                      l10n.averagePlaytime,
                      style: TextStyle(color: Color.fromARGB(255, 197, 194, 194)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      playtime == 0 ? l10n.noData : '$playtime ${l10n.hoursShort}',
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(color: Color.fromARGB(255, 127, 124, 124), thickness: 1),
                Column(
                  children: [
                    Text(
                      l10n.metacritic,
                      style: TextStyle(color: Color.fromARGB(255, 197, 194, 194)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      metacritic == 0 ? l10n.noData : metacritic.toString(),
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(color: Color.fromARGB(255, 127, 124, 124), thickness: 1),
                Column(
                  children: [
                    Text(
                      l10n.released,
                      style: TextStyle(color: Color.fromARGB(255, 197, 194, 194)),
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
