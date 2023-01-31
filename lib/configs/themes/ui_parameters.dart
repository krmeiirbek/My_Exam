import 'package:get/get.dart';

const _mobileScreenPadding = 25.0;

class UIParameters {
  static double get mobileScreenPadding => _mobileScreenPadding;
  static bool isDarkMode() => Get.isDarkMode;
}
