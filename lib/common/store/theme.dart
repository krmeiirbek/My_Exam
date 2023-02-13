import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/style.dart';

class ThemeStore extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  void initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;

  ThemeData get lightTheme => _lightTheme;
}
