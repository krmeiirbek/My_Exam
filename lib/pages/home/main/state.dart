import 'package:get/get.dart';

class MainState {
  final isLoading = false.obs;
  final isMainPage = MainSubjectPage.subjectPage.obs;
}

enum MainSubjectPage{
  subjectPage,
  comboPage,
  myLessonsPage,
}