import 'package:flutter/material.dart';

/// A class that holds the application's theme configuration.
class AppTheme {
  /// Light theme configuration.
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,

      // Background color for scaffold
      scaffoldBackgroundColor: Colors.grey[100],

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // TextField (Input) theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),

      // Card component theme
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //   elevation: 4,
      //   margin: const EdgeInsets.all(8),
      //   color: Colors.white,
      // ),

      // Icon color
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }

  /// Dark theme configuration.
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,

      // Background color for scaffold
      scaffoldBackgroundColor: Colors.grey[900],

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // TextField (Input) theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[850],
      ),

      // Card component theme
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //   elevation: 4,
      //   margin: const EdgeInsets.all(8),
      //   color: Colors.grey[800],
      // ),

      // Icon color
      iconTheme: const IconThemeData(color: Colors.white70),
    );
  }
}
