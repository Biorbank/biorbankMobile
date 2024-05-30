import 'package:flutter/material.dart';

class PrimaryTheme {
  ThemeData? primaryTheme = ThemeData(
    colorScheme: blueColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme(color: blueColorScheme.primary),
  );
}

const blueColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1C1460),
    onPrimary: Color(0xFF2A2AA0),
    secondary: Color(0xFFE1E1E1),
    onSecondary: Color(0xFFF1F1F1),
    error: Colors.red,
    onError: Color(0xFF1C1460),
    surface: Color(0xFF0060A9),
    onSurface: Color(0xFFFFFFFF),
    inversePrimary:  Color(0xFFF7F8FA),
    shadow: Colors.black,
    onSecondaryContainer: Color(0xFFA5A5A5),
    onSecondaryFixed: Color(0xFFE9E9E9),
    errorContainer: Color(0xFFF6F8FC));
