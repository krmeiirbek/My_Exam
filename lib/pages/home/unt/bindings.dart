import 'package:get/get.dart';

import 'controller.dart';

class UNTBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UNTController>(() => UNTController());
  }
}
