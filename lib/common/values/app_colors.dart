import 'package:flutter/material.dart';

import '../style/style.dart';

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

Color unselectedIconColor() =>
    UIParameters.isDarkMode() ? primaryTextDark : secondaryTextLight;

Color secondaryTextColor() =>
    UIParameters.isDarkMode() ? secondaryTextDark : secondaryTextLight;

Gradient appBarGradient() =>
    UIParameters.isDarkMode() ? appBarDarkGradient : appBarLightGradient;

Gradient gradient1() => const LinearGradient(colors: [
      Color.fromARGB(255, 220, 85, 74),
      Color.fromARGB(255, 232, 159, 58),
    ]);
Gradient gradient2() => const LinearGradient(colors: [
  Color.fromARGB(255, 133, 94, 238),
  Color.fromARGB(255, 77, 126, 242),
]);
Gradient gradient3() => const LinearGradient(colors: [
  Color.fromARGB(255, 67, 57, 195),
  Color.fromARGB(255, 98, 101, 201),
]);
Gradient gradient4() => const LinearGradient(colors: [
  Color.fromARGB(255, 85, 181, 165),
  Color.fromARGB(255, 106, 209, 158),
]);
Gradient gradient5() => const LinearGradient(colors: [
  Color.fromARGB(255, 54, 99, 234),
  Color.fromARGB(255, 109, 163, 237),
]);
Gradient gradient6() => const LinearGradient(colors: [
  Color.fromARGB(255, 116, 163, 52),
  Color.fromARGB(255, 106, 208, 155),
]);
Gradient gradient7() => const LinearGradient(colors: [
  Color.fromARGB(255, 204, 122, 47),
  Color.fromARGB(255, 231, 122, 111),
]);
Gradient gradient8() => const LinearGradient(colors: [
  Color.fromARGB(255, 214, 100, 44),
  Color.fromARGB(255, 237, 151, 78),
]);
Gradient gradient9() => const LinearGradient(colors: [
  Color.fromARGB(255, 164, 45, 39),
  Color.fromARGB(255, 82, 69, 216),
]);
Gradient gradient10() => const LinearGradient(colors: [
  Color.fromARGB(255, 5, 0, 0),
  Color.fromARGB(255, 195, 56, 49),
]);
