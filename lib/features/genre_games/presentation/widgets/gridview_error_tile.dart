// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

class GridViewErrorTile extends StatelessWidget {
  final String name;
  final int popularity;

  const GridViewErrorTile({
    super.key,
    required this.name,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color.fromARGB(255, 27, 62, 110),
                width: 5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.error,
                  size: 35,
                  color: Colors.red,
                ),
                Text(
                  'Photo not available',
                  style: TextStyle(
                    color: CustomTheme.theme.colorScheme.primary,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 27, 62, 110),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.5,
                        color: CustomTheme.theme.colorScheme.primary,
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
                      style: TextStyle(
                        color: CustomTheme.theme.colorScheme.primary,
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
  }
}
