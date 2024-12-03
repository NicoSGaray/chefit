import 'package:flutter/material.dart';

// Defines the overall theme for the app
final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF8B4513), // Rich brown primary color
    onPrimary: Color(0xFFFFF8E1), // Light cream text on brown primary surfaces
    secondary: Color(0xFFFFA726), // Warm, vibrant orange secondary color
    onSecondary: Color(0xFF5D4037), // Medium brown text on orange surfaces
    error: Color(0xFFB00020), // Standard red for errors
    onError: Color(0xFF3E2723), // Dark brown text on error surfaces
    surface: Color(0xFFFFF3E0), // Muted light surface color
    onSurface: Color(0xFF5D4037), // Medium brown for text on surfaces
  ),
  scaffoldBackgroundColor: const Color(0xFFFFF8E1), // Light cream background
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF8B4513), // Brown AppBar
    foregroundColor: Color(0xFFFFF8E1), // Light cream text and icons
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFA726), // Orange button background
      foregroundColor: const Color(0xFF5D4037), // Medium brown text on buttons
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFFFA726), // Orange text for text buttons
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFFFF3E0), // Light surface for text fields
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFFA726)), // Orange focus border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF8B4513)), // Brown normal border
    ),
    labelStyle: TextStyle(color: Color(0xFF8B4513)), // Labels in brown
  ),
  iconTheme: const IconThemeData(color: Color(0xFF8B4513)), // Icons in brown
);