import 'package:flutter/material.dart';

import 'sub_theme_data_mixin.dart';

const Color primaryDark = Color(0xff4785EB);
const Color onPrimaryDark = Color(0xffFFFFFF);
const Color secondaryDark = Color(0xff3C8DEF);
const Color tertiaryDark = Color(0xff599BF0);
const Color alternateDark = Color(0xff37374C);
const Color errorDark = Color(0xffE24C4B);
const Color onErrorDark = Color(0xffE24C4B);
const Color primaryBGDark = Color(0xff16162F);
const Color secondaryBGDark = Color(0xff000000);
const Color primaryTextDark = Color(0xffFFFFFF);
const Color secondaryTextDark = Color(0xff999999);
const Color primaryBtnTextDark = Color(0xffFFFFFF);
const Color surfaceDark = Color(0xff222246);
const Color onSurfaceDark = Color(0xffC3C3C3);

const Gradient appBarDarkGradient = LinearGradient(
  colors: [
    onPrimaryDark,
    onPrimaryDark,
  ],
);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBGDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: getTextThemes().apply(
        bodyColor: primaryTextDark,
        displayColor: primaryTextDark,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryDark,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDark,
        onPrimary: onPrimaryDark,
        secondary: secondaryDark,
        onSecondary: tertiaryDark,
        background: primaryBGDark,
        onBackground: secondaryBGDark,
        error: errorDark,
        onError: onErrorDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
      ),
    );
  }
}
