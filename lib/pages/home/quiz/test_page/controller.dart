import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
import 'state.dart';

class TestPageController extends GetxController {
  TestPageController();

  final state = TestPageState();

  @override
  void onInit() {
    state.isLoading.value = true;
    state.subjects.addAll([
      Subject(name: "Қазақстан тарихы", questions: state.questions2),
      Subject(name: "Оқу сауаттылық", questions: state.questions2),
      Subject(name: "Математикалық сауаттылық", questions: state.questions2),
      Subject(name: "Химия", questions: state.questions),
      Subject(name: "Биология", questions: state.questions),
    ]);
    state.isLoading.value = false;
    super.onInit();
  }

  void nextQuestion() {
    if (state.subjects.length != state.subjectId.value + 1) {
      if (state.subjects[state.subjectId.value].questions?.length !=
          state.questionId.value + 1) {
        state.questionId.value++;
      } else {
        state.subjectId.value++;
        state.questionId.value = 0;
      }
    } else {
      if (state.subjects[state.subjectId.value].questions?.length !=
          state.questionId.value + 1) {
        state.questionId.value++;
      } else {
        print("in the begin");
      }
    }
  }

  void prevQuestion() {
    if (0 != state.subjectId.value) {
      if (0 != state.questionId.value) {
        state.questionId.value--;
      } else {
        state.subjectId.value--;
        state.questionId.value =
            state.subjects[state.subjectId.value].questions!.length - 1;
      }
    } else {
      if (0 != state.questionId.value) {
        state.questionId.value--;
      } else {
        print("the end");
      }
    }
  }

  void changeSubject(int index) {
    state.subjectId.value = index;
    state.questionId.value = 0;
    update();
  }

  void changeQuestion(int index) {
    state.questionId.value = index;
    update();
  }
}
