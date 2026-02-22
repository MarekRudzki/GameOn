// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';

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
      onPressed: () => _showDataProviderDialog(context),
    );
  }

  void _showDataProviderDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const _DataProviderDialog());
  }
}

class _DataProviderDialog extends StatelessWidget {
  const _DataProviderDialog();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      backgroundColor: CustomTheme.theme.colorScheme.onSurface,
      title: Text(
        l10n.dataProvider,
        style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
      ),
      actions: [
        Center(
          child: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.check, color: Colors.green),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.allGamesDataRatings,
            style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
          ),
          const SizedBox(height: 16),
          _RawgLinkButton(onError: () => _showErrorMessage(context)),
        ],
      ),
    );
  }

  void _showErrorMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.browserCannotBeOpened,
          style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
        ),
        backgroundColor: const Color.fromARGB(255, 40, 40, 42),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class _RawgLinkButton extends StatelessWidget {
  final VoidCallback onError;

  const _RawgLinkButton({required this.onError});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color.fromARGB(158, 68, 137, 255),
        side: const BorderSide(width: 2, color: Colors.white),
      ),
      onPressed: () => _launchRawgSite(context),
      child: Text(l10n.visitRawgSite, style: const TextStyle(fontSize: 15)),
    );
  }

  Future<void> _launchRawgSite(BuildContext context) async {
    final Uri url = Uri.parse('https://rawg.io/');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } on Exception {
      onError();
    }
  }
}
