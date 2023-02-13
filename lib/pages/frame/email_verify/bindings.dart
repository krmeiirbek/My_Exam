import 'package:get/get.dart';

import 'controller.dart';

class EmailVerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerifyController>(() => EmailVerifyController());
  }
}
