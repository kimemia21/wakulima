import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Role { TANKER, FIGHTER, MARKSMAN, MAGE, ASSASIN }

enum Difficulty { LOW, MODERATE, HIGH }

final backgoundColor = Colors.grey.shade300;
final imageOpacity = Colors.black54;
final appbarColor = Color(0xff112120);

final detailsTextColor = Color(0xff112120);

final difficultyEnableColor = Color(0xff08d6f6);
final difficultyDisableColor = Color(0xff023240);

final textTheme = TextTheme(
  titleLarge: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
      fontStyle: FontStyle.italic,
      letterSpacing: 4.0),
  titleMedium: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
      letterSpacing: 1.0),
  titleSmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
      letterSpacing: 1.0),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
      letterSpacing: 1.0),
);
