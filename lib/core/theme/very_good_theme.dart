import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';

class VeryGoodTheme {
  factory VeryGoodTheme() {
    return _instance;
  }

  VeryGoodTheme._internal();

  static final VeryGoodTheme _instance = VeryGoodTheme._internal();

  ThemeData get defaultTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.montserratTextTheme(),
      primaryColor: VeryGoodColors.blue,
      primaryTextTheme: GoogleFonts.montserratTextTheme(
        const TextTheme(
          labelSmall: TextStyle(
            color: VeryGoodColors.white,
            fontSize: 14,
          ),
          labelMedium: TextStyle(
            color: VeryGoodColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            color: VeryGoodColors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
