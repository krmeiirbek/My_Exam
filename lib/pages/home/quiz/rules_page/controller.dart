import 'package:get/get.dart';

import '../../../../common/routes/routes.dart';
import 'state.dart';

class RulesPageController extends GetxController {
  RulesPageController();

  final state = RulesPageState();
  String time = "";
  @override
  void onInit() {
    state.isLoading.value = true;
    time = state.isCompleteTest.value ? "4" : "1";
    state.subject1.value = "Математика";
    state.subject2.value = "Информатика";
    state.isLoading.value = false;
    super.onInit();
  }

  void goTestPage() {
    Get.offNamed(AppRoutes.testPage);
  }
}
