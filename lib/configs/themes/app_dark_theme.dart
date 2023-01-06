import 'package:flutter/material.dart';
import 'package:my_exam/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColor = Color(0xff16162F);
const Color mainTextDarkColor = Color(0xffffffff);
const Color primaryColorDarkColor = Color(0xff37374C);

class DarkTheme with SubThemeData {
  buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      brightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextDarkColor,
        displayColor: mainTextDarkColor,
      ),
      scaffoldBackgroundColor: primaryDarkColor,
      primaryColorDark: primaryColorDarkColor,
    );
  }
}