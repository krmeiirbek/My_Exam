import 'package:flutter/material.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';
import 'ui_parameters.dart';

Color prColor() => UIParameters.isDarkMode() ? primaryDark : primaryLight;

Color secondaryColor() =>
    UIParameters.isDarkMode() ? secondaryDark : secondaryLight;

Color tertiaryColor() =>
    UIParameters.isDarkMode() ? tertiaryDark : tertiaryLight;

Color alternateColor() =>
    UIParameters.isDarkMode() ? alternateDark : alternateLight;

Color prBackground() =>
    UIParameters.isDarkMode() ? primaryBGDark : primaryBGLight;

Color secondaryBackground() =>
    UIParameters.isDarkMode() ? secondaryBGDark : secondaryBGLight;

Color prTextColor() =>
    UIParameters.isDarkMode() ? primaryTextDark : primaryTextLight;

Color secondaryTextColor() =>
    UIParameters.isDarkMode() ? secondaryTextDark : secondaryTextLight;

Gradient appBarGradient() =>
    UIParameters.isDarkMode() ? appBarDarkGradient : appBarLightGradient;
