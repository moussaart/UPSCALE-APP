import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final Color mainColor = Color(0XFFFE7A36);
  static final Color secondColor = Color(0XFF3652AD);
  static final Color thirdColor = Color(0XFF280274);
  static final Color finalColor = Color(0XFFE9F6FF);

  static final List<Color> GradientColors = [
    CustomTheme.mainColor,
    CustomTheme.secondColor,
  ];

  static final lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: mainColor,
      secondary: secondColor,
      onPrimary: Colors.black,
      error: Colors.red,
    ),
    textTheme: TextTheme(
        headline1: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        headline2: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
  );

  static final darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: const Color(0XFF080808),
      primary: secondColor,
      secondary: mainColor,
      onPrimary: Colors.white,
      error: Colors.red,
    ),
    textTheme: TextTheme(
        headline1: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        headline2: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
  );
}
