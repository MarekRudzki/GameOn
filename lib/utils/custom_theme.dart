// Flutter imports:
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: Color.fromARGB(255, 2, 31, 68),
      onSurface: Color.fromARGB(255, 15, 47, 91),
      onPrimary: Color.fromARGB(255, 127, 124, 124),
      primary: Colors.white,
      secondary: Colors.pinkAccent,
      tertiary: Colors.black,
      scrim: Color.fromARGB(255, 183, 180, 180),
    ),
  );
}
