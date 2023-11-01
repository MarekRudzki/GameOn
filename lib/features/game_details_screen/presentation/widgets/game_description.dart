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
    return Column(
      children: [
        const Divider(
          color: Color.fromARGB(255, 127, 124, 124),
          endIndent: 25,
          indent: 25,
          thickness: 1,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Center(
            child: Text(
              'About:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ReadMoreText(
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
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(
            color: Color.fromARGB(255, 127, 124, 124),
            endIndent: 25,
            indent: 25,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
