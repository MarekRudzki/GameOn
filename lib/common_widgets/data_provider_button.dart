// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_glow/flutter_glow.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:gameon/utils/custom_theme.dart';

class DataProviderButton extends StatelessWidget {
  const DataProviderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: GlowIcon(
        Icons.info_outline,
        color: CustomTheme.theme.colorScheme.primary,
        size: 22,
        glowColor: CustomTheme.theme.colorScheme.tertiary,
        blurRadius: 5,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              backgroundColor: CustomTheme.theme.colorScheme.onBackground,
              title: Text(
                'Data provider',
                style: TextStyle(
                  color: CustomTheme.theme.colorScheme.primary,
                ),
              ),
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
                  Text(
                    'All games data, ratings and screenshots are from RAWG database.',
                    style: TextStyle(
                      color: CustomTheme.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  OutlinedButton(
                    child: const Text(
                      'Visit RAWG site',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(158, 68, 137, 255),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.white,
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
                              child: Wrap(
                                children: [
                                  Center(
                                    child: Text(
                                      'The browser cannot be opened.',
                                      style: TextStyle(
                                        color: CustomTheme
                                            .theme.colorScheme.primary,
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
