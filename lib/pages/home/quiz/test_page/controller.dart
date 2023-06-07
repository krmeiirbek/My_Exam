import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
import 'state.dart';

class TestPageController extends GetxController {
  TestPageController();

  final state = TestPageState();
  final calcController = TextEditingController();
  late Timer timer;

  @override
  void onInit() {
    state.isLoading.value = true;
    state.subjects.addAll([
      SubjectQuiz(
        name: "Қазақстан тарихы",
        questions: state.questions4,
        id: 1,
        image_url: '',
      ),
      SubjectQuiz(
        name: "Оқу сауаттылық",
        questions: state.questions3,
        id: 1,
        image_url: '',
      ),
      SubjectQuiz(
        name: "Математикалық сауаттылық",
        questions: state.questions2,
        id: 1,
        image_url: '',
      ),
      SubjectQuiz(
        name: "Химия",
        questions: state.questions,
        id: 1,
        image_url: '',
      ),
      SubjectQuiz(
        name: "Биология",
        questions: state.questions1,
        id: 1,
        image_url: '',
      ),
    ]);
    state.time.value = 30;
    startTimer();
    state.isLoading.value = false;
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state.time.value--;
      if (state.time.value <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    calcController.dispose();
    timer.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (state.subjects.length != state.subjectId.value + 1) {
      if (state.subjects[state.subjectId.value].questions.length !=
          state.questionId.value + 1) {
        state.questionId.value++;
      } else {
        state.subjectId.value++;
        state.questionId.value = 0;
      }
    } else {
      if (state.subjects[state.subjectId.value].questions.length !=
          state.questionId.value + 1) {
        state.questionId.value++;
      } else {
        print("end");
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
            state.subjects[state.subjectId.value].questions.length - 1;
      }
    } else {
      if (0 != state.questionId.value) {
        state.questionId.value--;
      } else {
        print("begin");
      }
    }
  }

  void changeSubject(int index) {
    state.subjectId.value = index;
    state.questionId.value = 0;
  }

  void changeQuestion(int index) {
    state.questionId.value = index;
  }

  void selectOption(Option option) {
    if (state.subjects[state.subjectId.value].questions[state.questionId.value]
        .selectedOptions
        .contains(option)) {
      state.subjects[state.subjectId.value].questions[state.questionId.value]
          .selectedOptions
          .remove(option);
    } else {
      if (state.subjects[state.subjectId.value]
          .questions[state.questionId.value].oneAnswer) {
        state.subjects[state.subjectId.value].questions[state.questionId.value]
            .selectedOptions
            .clear();
        state.subjects[state.subjectId.value].questions[state.questionId.value]
            .selectedOptions
            .add(option);
      } else {
        state.subjects[state.subjectId.value].questions[state.questionId.value]
            .selectedOptions
            .add(option);
      }
    }
  }

  void goQuestionFromMenu(SubjectQuiz subject, QuestionItem question) {
    state.menuDialog.value = false;
    changeSubject(state.subjects.indexOf(subject));
    changeQuestion(
        state.subjects[state.subjectId.value].questions.indexOf(question));
  }

  void calcButton(String code) {}
}
