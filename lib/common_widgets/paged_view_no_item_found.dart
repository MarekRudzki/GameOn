import 'package:flutter/material.dart';

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
        const Text(
          'No games found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
