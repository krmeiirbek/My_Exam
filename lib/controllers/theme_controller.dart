import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/configs/themes/app_dark_theme.dart';
import 'package:my_exam/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  void initializeThemeData () {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}