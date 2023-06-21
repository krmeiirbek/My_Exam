import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class MainState {
  final isLoading = false.obs;
  final isMainPage = MainSubjectPage.subjectPage.obs;
  final subjects = <Subject>[].obs;
}

enum MainSubjectPage{
  subjectPage,
  comboPage,
}