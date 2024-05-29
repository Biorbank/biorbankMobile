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
    error: Color(0xFF1C1460),
    onError: Color(0xFF1C1460),
    surface: Color(0xFF1C1460),
    onSurface: Color(0xFFFFFFFF),
    
    shadow: Colors.black,
    
    errorContainer: Color(0xFFF6F8FC));
