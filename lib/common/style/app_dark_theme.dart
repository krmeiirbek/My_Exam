import 'package:flutter/material.dart';

import '../values/values.dart';
import 'sub_theme_data_mixin.dart';

const Color primaryDark = Color(0xff0A84FF);
const Color secondaryDark = Color(0xff1c1c1c);
const Color tertiaryDark = Color(0xffFF453A);
const Color alternateDark = Color(0xff30D158);
const Color primaryTextDark = Color(0xffFFFFFF);
const Color secondaryTextDark = Color(0xffAEAEB2);
const Color primaryBGDark = Color(0xff1C1C1E);
const Color secondaryBGDark = Color(0xff1C1C1E);
const Color accent1Dark = Color(0xff4FBAE6);
const Color accent2Dark = Color(0xffF69303);
const Color accent3Dark = Color(0xffE3254B);
const Color accent4Dark = Color(0xffAE8C5B);
const Color successDark = Color(0xff2AAB4D);
const Color errorDark = Color(0xffDE3329);
const Color warningDark = Color(0xffDFB702);
const Color infoDark = Color(0xff0872D0);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBGDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryBGDark,
        unselectedItemColor: secondaryTextDark,
      ),
      unselectedWidgetColor: secondaryTextDark,
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: secondaryBGDark,
      ),
      textTheme: getTextThemes().apply(
        bodyColor: primaryTextDark,
        displayColor: primaryTextDark,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryDark,
        textTheme: ButtonTextTheme.accent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryBGDark,
        titleTextStyle: title2.copyWith(color: primaryTextDark),
        actionsIconTheme: const IconThemeData(color: primaryTextDark),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDark,
        onPrimary: primaryDark,
        secondary: secondaryDark,
        onSecondary: primaryTextDark,
        background: primaryBGDark,
        onBackground: secondaryBGDark,
        error: errorDark,
        onError: warningDark,
        surface: successDark,
        onSurface: infoDark,
        tertiary: tertiaryDark
      ),
    );
  }
}
