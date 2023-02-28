import 'package:get/get.dart';

import 'controller.dart';
import 'main/controller.dart';
import 'my_courses/controller.dart';
import 'notice/controller.dart';
import 'profile/controller.dart';
import 'leaderboard/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<LeaderboardController>(() => LeaderboardController());
    Get.lazyPut<MyCoursesController>(() => MyCoursesController());
    Get.lazyPut<NoticeController>(() => NoticeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
