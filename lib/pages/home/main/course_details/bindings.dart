import 'package:get/get.dart';

import 'controller.dart';

class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailsController>(() => CourseDetailsController());
  }

}