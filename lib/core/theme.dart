import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    //Define black as the color that most buttons and icons, and white as the color of the background
    primaryColor: Colors.black,
    hintColor: Colors.black,
    cardColor: Colors.grey[300],
    focusColor: Colors.black,
    hoverColor: Colors.black,
    shadowColor: Colors.black,
    splashColor: Colors.black,
    canvasColor: Colors.white,
    dividerColor: Colors.black,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.black,
    disabledColor: Colors.black,
    highlightColor: Colors.black,
    indicatorColor: Colors.black,
    secondaryHeaderColor: Colors.black,
    dialogBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.black,
    applyElevationOverlayColor: true,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
