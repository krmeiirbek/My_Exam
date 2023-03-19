import 'package:get/get.dart';

import 'controller.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}
