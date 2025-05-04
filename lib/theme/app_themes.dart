import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue.shade800,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.blue.shade800,
      secondary: Colors.blue.shade600,
    ),
    scaffoldBackgroundColor: Colors.grey.shade50,
    cardColor: Colors.white,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.black87),
      bodyLarge: TextStyle(color: Colors.black12),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade300,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.blue.shade300,
      secondary: Colors.blue.shade200,
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardColor: Colors.grey.shade800,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
  );
}