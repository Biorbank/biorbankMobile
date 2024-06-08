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
    onTertiary: Color(0xFF2BD56F),
    onInverseSurface: Color(0xFF00CD52),
    onSecondaryContainer: Color(0xFFA5A5A5),
    onSecondaryFixed: Color(0xFFE9E9E9),
    onPrimaryContainer: Color(0xFFF6F5FA),
    outline: Color(0xFF5D5D5B),
    errorContainer: Color(0xFFF6F8FC),
    tertiary: Color(0xFFAAAAAA),
    primaryFixed: Color(0xFF2E30B2)
    
    );
