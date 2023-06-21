import 'package:flutter/material.dart';

import '../style/style.dart';

Color primaryColor() => UIParameters.isDarkMode() ? primaryDark : primary;
Color secondaryColor() => UIParameters.isDarkMode() ? secondaryDark : secondary;
Color tertiaryColor() => UIParameters.isDarkMode() ? tertiaryDark : tertiary;
Color alternateColor() => UIParameters.isDarkMode() ? alternateDark : alternate;
Color primaryTextColor() => UIParameters.isDarkMode() ? primaryTextDark : primaryText;
Color secondaryTextColor() => UIParameters.isDarkMode() ? secondaryTextDark : secondaryText;
Color primaryBGColor() => UIParameters.isDarkMode() ? primaryBGDark : primaryBG;
Color secondaryBGColor() => UIParameters.isDarkMode() ? secondaryBGDark : secondaryBG;
Color accent1Color() => UIParameters.isDarkMode() ? accent1Dark : accent1;
Color accent2Color() => UIParameters.isDarkMode() ? accent2Dark : accent2;
Color accent3Color() => UIParameters.isDarkMode() ? accent3Dark : accent3;
Color accent4Color() => UIParameters.isDarkMode() ? accent4Dark : accent4;
Color successColor() => UIParameters.isDarkMode() ? successDark : success;
Color errorColor() => UIParameters.isDarkMode() ? errorDark : error;
Color warningColor() => UIParameters.isDarkMode() ? warningDark : warning;
Color infoColor() => UIParameters.isDarkMode() ? infoDark : info;
