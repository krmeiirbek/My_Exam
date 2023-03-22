import 'package:get/get.dart';

import 'controller.dart';

class LessonPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonPageController>(() => LessonPageController());
  }

}