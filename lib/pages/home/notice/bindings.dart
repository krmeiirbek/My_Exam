import 'package:get/get.dart';

import 'controller.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeController>(() => NoticeController());
  }
}
