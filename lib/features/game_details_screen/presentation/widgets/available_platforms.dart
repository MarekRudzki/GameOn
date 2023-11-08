// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

class AvailablePlatforms extends StatelessWidget {
  final List<String> platforms;

  const AvailablePlatforms({
    super.key,
    required this.platforms,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Text(
                'Available on: ',
                style: TextStyle(
                  color: CustomTheme.theme.colorScheme.scrim,
                  fontSize: 15,
                ),
              ),
            ),
            TextSpan(
              text: platforms.join(', '),
              style: TextStyle(
                color: CustomTheme.theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
