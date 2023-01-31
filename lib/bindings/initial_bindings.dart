import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/bottom_navbar_controller.dart';
import '../controllers/leaderboard_controller.dart';
import '../controllers/ubt_controller.dart';
import '../controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController());
    Get.put(UBTController());
    Get.put(BottomNavbarController());
    Get.put(LeaderboardController());
  }
}