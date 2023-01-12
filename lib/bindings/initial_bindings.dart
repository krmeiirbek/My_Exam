import 'package:get/get.dart';
import 'package:my_exam/controllers/bottom_navbar_controller.dart';
import 'package:my_exam/controllers/leaderboard_controller.dart';
import 'package:my_exam/controllers/ubt_controller.dart';

import '../controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => UBTController());
    Get.lazyPut(() => BottomNavbarController());
    Get.lazyPut(() => LeaderboardController());
  }
}