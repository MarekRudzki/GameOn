import 'package:flutter/material.dart';
import 'package:gameon/utils/custom_theme.dart';

class OnWillPopAlertDialog extends StatelessWidget {
  const OnWillPopAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Please confirm',
        style: TextStyle(
          color: CustomTheme.theme.colorScheme.primary,
        ),
      ),
      backgroundColor: CustomTheme.theme.colorScheme.background,
      content: Text(
        'Do you want to exit the app?',
        style: TextStyle(
          color: CustomTheme.theme.colorScheme.primary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: TextStyle(
              color: CustomTheme.theme.colorScheme.primary,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'Yes',
            style: TextStyle(
              color: CustomTheme.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
