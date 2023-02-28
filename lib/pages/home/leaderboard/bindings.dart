import 'package:get/get.dart';

import 'controller.dart';

class LeaderboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderboardController>(() => LeaderboardController());
  }
}
