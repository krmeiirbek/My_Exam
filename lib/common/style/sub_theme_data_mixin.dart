import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubThemeData {
  TextTheme getTextThemes() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(),
    ).apply(fontFamily: 'SF UI Display');
  }
}
