import 'package:get/get.dart';

import 'controller.dart';

class SubjectPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectPageController>(() => SubjectPageController());
  }

}