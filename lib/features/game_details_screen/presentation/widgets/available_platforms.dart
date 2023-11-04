import 'package:flutter/material.dart';

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
            const WidgetSpan(
              child: Text(
                'Available on: ',
                style: TextStyle(
                  color: Color.fromARGB(255, 197, 194, 194),
                  fontSize: 15,
                ),
              ),
            ),
            TextSpan(
              text: platforms.join(', '),
              style: const TextStyle(
                color: Colors.white,
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
