// Flutter imports:
import 'package:flutter/material.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';

// Package imports:
import 'package:readmore/readmore.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';

class GameDescription extends StatelessWidget {
  final String description;

  const GameDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final double dividerIndent = MediaQuery.sizeOf(context).width * 0.25;
    return Column(
      children: [
        Divider(
          color: CustomTheme.theme.colorScheme.onPrimary,
          endIndent: dividerIndent,
          indent: dividerIndent,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ReadMoreText(
            description,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimLines: 6,
            textAlign: TextAlign.justify,
            style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
            trimCollapsedText: l10n.readMore,
            trimExpandedText: l10n.showLess,
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomTheme.theme.colorScheme.secondary,
            ),
            lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomTheme.theme.colorScheme.secondary,
            ),
          ),
        ),
        Divider(
          color: CustomTheme.theme.colorScheme.onPrimary,
          endIndent: dividerIndent,
          indent: dividerIndent,
          thickness: 1,
        ),
      ],
    );
  }
}
