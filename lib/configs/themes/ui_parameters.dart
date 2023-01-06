import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;

double get mobileScreenPadding => _mobileScreenPadding;

class UIParameters {
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() => Get.isDarkMode;
}
