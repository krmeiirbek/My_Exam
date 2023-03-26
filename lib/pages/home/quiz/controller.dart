import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import 'state.dart';

class QuizController extends GetxController {
  QuizController();

  final state = QuizState();

  void changePage(EnumTestPage testPage){
    state.testPage.value = testPage;
  }

  void goRulesPage() {
    Get.toNamed(AppRoutes.rulesPage);
  }
}
