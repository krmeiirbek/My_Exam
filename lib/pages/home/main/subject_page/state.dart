import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';

class SubjectPageState {
  final isLoading = false.obs;
  final subjectID = "".obs;
  final subjectName = "".obs;
  final subjectIconUrl = "".obs;
  final courses = <CourseItem>[].obs;
}
