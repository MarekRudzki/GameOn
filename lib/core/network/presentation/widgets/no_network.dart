// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/l10n/app_localizations.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.grey.withAlpha(235),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/no_network_dino.png', cacheWidth: 100),
            const SizedBox(height: 40),
            Text(
              l10n.noNetworkConnection,
              style: TextStyle(fontSize: 20, color: CustomTheme.theme.colorScheme.primary),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                l10n.pleaseTurnOnInternet,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: CustomTheme.theme.colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
