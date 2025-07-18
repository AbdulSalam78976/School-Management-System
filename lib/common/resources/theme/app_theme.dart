import 'package:flutter/material.dart';

final AppTheme = ThemeData(
  primaryColor: const Color(0xFF3E5F44),
  scaffoldBackgroundColor: const Color(0xFFE8FFD7),
  colorScheme: const ColorScheme(
    primary: Color(0xFF3E5F44),
    secondary: Color(0xFF5E936C),
    surface: Colors.white,
    background: Color(0xFFE8FFD7),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF1B1B1B),
    onBackground: Color(0xFF1B1B1B),
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF3E5F44),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF1B1B1B),
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: Color(0xFF1B1B1B)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF5E936C),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF5E936C), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF3E5F44), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
    labelStyle: const TextStyle(color: Color(0xFF3E5F44)),
  ),
);
