import 'package:flutter/material.dart';
import 'package:my_exam/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColor = Color(0xffF6F7FC);
const Color mainTextLightColor = Color(0xff3D3D74);
const Color primaryColorLightColor = Color(0xffE3F0FF);

class LightTheme with SubThemeData {
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      brightness: Brightness.light,
      primaryColor: primaryLightColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextLightColor,
        displayColor: mainTextLightColor,
      ),
      scaffoldBackgroundColor: primaryLightColor,
      primaryColorDark: primaryColorLightColor,
    );
  }
}
