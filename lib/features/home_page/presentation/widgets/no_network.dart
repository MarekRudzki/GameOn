import 'package:flutter/material.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.grey.withOpacity(0.92),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no_network_dino.png',
            cacheWidth: 100,
          ),
          const SizedBox(height: 40),
          const Text(
            'No network connection',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Please turn on Internet and application will refresh',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
