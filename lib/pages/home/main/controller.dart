import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import 'state.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  @override
  Future<void> onInit() async {
    await getCourses();
    super.onInit();
  }

  getCourses() async {
    state.isLoading.value = true;
    // var res = await CourseAPI.getCourses();
    // if (res.courses != null) {
    //   state.courses.clear();
    //   state.courses.addAll(res.courses!);
    // }
    await Future.delayed(const Duration(milliseconds: 200));
    state.isLoading.value = false;
  }

  goCourseDetails() {
    Get.toNamed(AppRoutes.courseDetails);
  }

  goSubjectPage() {
    Get.toNamed(AppRoutes.subjectPage);
  }

}
