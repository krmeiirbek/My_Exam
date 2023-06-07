import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
import '../../../../common/apis/apis.dart';
import 'state.dart';

class SubjectPageController extends GetxController {
  SubjectPageController();
  final state = SubjectPageState();

  @override
  Future<void> onInit() async {
    state.subjectID.value = Get.parameters["id"] ?? "";
    state.subjectName.value = Get.parameters["name"] ?? "";
    state.subjectIconUrl.value = Get.parameters["icon_url"] ?? "";
    await getCourses();
    super.onInit();
  }

  getCourses() async {
    state.isLoading.value = true;
    var res = await CourseAPI.getCourses(id: int.parse(state.subjectID.value));
    if (res.courses != null) {
      state.courses.clear();
      state.courses.addAll(res.courses as Iterable<CourseItem>);
    }
    await Future.delayed(const Duration(milliseconds: 200));
    state.isLoading.value = false;
  }
}