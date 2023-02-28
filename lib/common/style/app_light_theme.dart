import 'package:flutter/material.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';

import 'sub_theme_data_mixin.dart';

const Color primaryLight = Color(0xff4785EB);
const Color onPrimaryLight = Color(0xffFFFFFF);
const Color secondaryLight = Color(0xff3C8DEF);
const Color tertiaryLight = Color(0xff599BF0);
const Color alternateLight = Color(0xffE3F0FF);
const Color errorLight = Color(0xffE24C4B);
const Color onErrorLight = Color(0xffE24C4B);
const Color primaryBGLight = Color(0xffF6F7FC);
const Color secondaryBGLight = Color(0xffFFFFFF);
const Color primaryTextLight = Color(0xff3D3D74);
const Color secondaryTextLight = Color(0xff999999);
const Color primaryBtnLight = Color(0xffFFFFFF);
const Color surfaceLight = Color(0xffFFFFFF);
const Color onSurfaceLight = Color(0xffC3C3C3);

const Gradient appBarLightGradient = LinearGradient(
  colors: [
    tertiaryLight,
    secondaryLight,
  ],
);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: primaryBGLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: getTextThemes().apply(
        bodyColor: primaryTextLight,
        displayColor: primaryTextLight,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryLight,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryBGLight,
        titleTextStyle: title2.copyWith(color: primaryTextLight),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryLight,
        onPrimary: onPrimaryLight,
        secondary: secondaryLight,
        onSecondary: tertiaryLight,
        background: primaryBGLight,
        onBackground: secondaryBGLight,
        error: errorLight,
        onError: onErrorLight,
        surface: surfaceLight,
        onSurface: onSurfaceLight,
      ),
    );
  }
}
