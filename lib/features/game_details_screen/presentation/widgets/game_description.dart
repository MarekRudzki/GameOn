import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class GameDescription extends StatelessWidget {
  final String description;

  const GameDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double dividerIndent = MediaQuery.of(context).size.width * 0.25;
    return Column(
      children: [
        Divider(
          color: const Color.fromARGB(255, 127, 124, 124),
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
            style: const TextStyle(
              color: Colors.white,
            ),
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Show less',
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
        ),
        Divider(
          color: const Color.fromARGB(255, 127, 124, 124),
          endIndent: dividerIndent,
          indent: dividerIndent,
          thickness: 1,
        ),
      ],
    );
  }
}
