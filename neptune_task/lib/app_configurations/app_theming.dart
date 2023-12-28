// This file defines Flutter themes for light and dark modes.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Function to create a MaterialColor from a Color
MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final red = color.red;
  final green = color.green;
  final blue = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  // Generate shades for the MaterialColor
  for (final strength in strengths) {
    final ds = 0.5 - strength;

    swatch[(strength * 1000).round()] = Color.fromRGBO(
      red + ((ds < 0 ? red : (255 - red)) * ds).round(),
      green + ((ds < 0 ? green : (255 - green)) * ds).round(),
      blue + ((ds < 0 ? blue : (255 - blue)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

// Define the light theme
//the font is Google Fonts
var lightTheme = ThemeData(
    primarySwatch: createMaterialColor(const Color.fromARGB(255, 33, 42, 50)),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: GoogleFonts.poppins(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        titleSmall: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        labelLarge: GoogleFonts.poppins(
            fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
        labelMedium: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        labelSmall: GoogleFonts.lato(
            fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(fontSize: 13, color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(const Color.fromARGB(255, 33, 42, 50)),
      accentColor: const Color.fromARGB(255, 247, 81, 145),
      brightness: Brightness.light,
      cardColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 48, 48, 51)));

// Dark theme is the same as the light theme
var darkTheme = lightTheme;
