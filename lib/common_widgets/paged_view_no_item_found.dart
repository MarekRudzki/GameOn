import 'package:flutter/material.dart';
import 'package:gameon/utils/custom_theme.dart';

class PagedViewNoItemFound extends StatelessWidget {
  final String text;

  const PagedViewNoItemFound({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Text(
          'No games found',
          style: TextStyle(
            fontSize: 18,
            color: CustomTheme.theme.colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: CustomTheme.theme.colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
