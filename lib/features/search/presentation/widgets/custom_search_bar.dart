// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextFieldChanged;
  final Function() onIconTap;
  final Function() onTextFieldSubmitted;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onTextFieldChanged,
    required this.onIconTap,
    required this.onTextFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final searchTextFieldWidth = MediaQuery.sizeOf(context).width * 0.7;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomTheme.theme.colorScheme.primary,
              ),
              width: searchTextFieldWidth,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                onChanged: (value) {
                  onTextFieldChanged(value);
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                onSubmitted: (value) {
                  onTextFieldSubmitted();
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: InputBorder.none,
                  hintText: '${l10n.search}...',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 53, 63, 78)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      onIconTap();
                    },
                    icon: Icon(
                      Icons.search,
                      color: CustomTheme.theme.colorScheme.secondary,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
