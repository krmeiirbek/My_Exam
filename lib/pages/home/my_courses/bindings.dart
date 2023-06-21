import 'package:get/get.dart';

import 'controller.dart';

class MyCoursesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCoursesController>(() => MyCoursesController());
  }
}
