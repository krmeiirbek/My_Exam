import 'package:get/get.dart';

import 'state.dart';

class QuizController extends GetxController {
  QuizController();

  final state = QuizState();

  void changePage(TestPage testPage){
    state.testPage.value = testPage;
  }
}
