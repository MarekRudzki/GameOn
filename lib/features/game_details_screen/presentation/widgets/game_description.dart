// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:readmore/readmore.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

class GameDescription extends StatelessWidget {
  final String description;

  const GameDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double _dividerIndent = MediaQuery.sizeOf(context).width * 0.25;
    return Column(
      children: [
        Divider(
          color: CustomTheme.theme.colorScheme.onPrimary,
          endIndent: _dividerIndent,
          indent: _dividerIndent,
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
            style: TextStyle(
              color: CustomTheme.theme.colorScheme.primary,
            ),
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Show less',
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
          endIndent: _dividerIndent,
          indent: _dividerIndent,
          thickness: 1,
        ),
      ],
    );
  }
}
