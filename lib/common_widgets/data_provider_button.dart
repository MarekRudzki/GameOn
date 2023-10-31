import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:url_launcher/url_launcher.dart';

class DataProviderButton extends StatelessWidget {
  const DataProviderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const GlowIcon(
        Icons.info_outline,
        color: Colors.white,
        size: 22,
        glowColor: Colors.black,
        blurRadius: 5,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Data provider',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              backgroundColor: const Color.fromARGB(255, 40, 40, 42),
              actions: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'All games data, ratings and screenshots are from RAWG database.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Visit RAWG site',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://rawg.io/');
                      try {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } on Exception {
                        if (!context.mounted) return;
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                            );
                            return Container(
                              color: const Color.fromARGB(255, 40, 40, 42),
                              padding: const EdgeInsets.all(12),
                              child: const Wrap(
                                children: [
                                  Center(
                                    child: Text(
                                      'The browser cannot be opened.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
