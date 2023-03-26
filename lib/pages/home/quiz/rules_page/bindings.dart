import 'package:get/get.dart';

import 'controller.dart';

class RulesPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RulesPageController>(() => RulesPageController());
  }
}
