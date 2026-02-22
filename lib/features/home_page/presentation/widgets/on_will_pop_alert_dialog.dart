// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';

class OnWillPopAlertDialog extends StatelessWidget {
  const OnWillPopAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(
        l10n.pleaseConfirm,
        style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
      ),
      backgroundColor: CustomTheme.theme.colorScheme.surface,
      content: Text(
        l10n.doYouWantToExitApp,
        style: TextStyle(color: CustomTheme.theme.colorScheme.primary),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.no, style: TextStyle(color: CustomTheme.theme.colorScheme.primary)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.yes, style: TextStyle(color: CustomTheme.theme.colorScheme.primary)),
        ),
      ],
    );
  }
}
