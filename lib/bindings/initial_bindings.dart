import 'package:get/get.dart';
import 'package:my_exam/controllers/ubt_controller.dart';

import '../controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => UBTController());
  }
}