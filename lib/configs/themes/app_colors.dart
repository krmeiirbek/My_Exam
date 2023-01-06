import 'package:flutter/material.dart';
import 'package:my_exam/configs/themes/app_dark_theme.dart';
import 'package:my_exam/configs/themes/app_light_theme.dart';
import 'package:my_exam/configs/themes/ui_parameters.dart';

const Gradient appBarDarkGradient = LinearGradient(colors: [
  Color(0xff282347),
  Color(0xff282347),
]);
const Gradient appBarLightGradient = LinearGradient(colors: [
  Color(0xff6FB2FF),
  Color(0xff4785EB),
]);

Color mainBackground() =>
    UIParameters.isDarkMode() ? primaryDarkColor : primaryLightColor;

Gradient appBarGradient() =>
    UIParameters.isDarkMode() ? appBarDarkGradient : appBarLightGradient;

Color bottomNavBarBackgroundColor() =>
    UIParameters.isDarkMode() ? primaryDarkColor : Colors.white;

