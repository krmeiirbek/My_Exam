import 'package:get/get.dart';

import '../../../common/entities/entities.dart';
import '../../../common/apis/apis.dart';
import '../../../common/routes/routes.dart';
import 'state.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  @override
  Future<void> onInit() async {
    await getSubjects();
    super.onInit();
  }

  getSubjects() async {
    state.isLoading.value = true;
    var res = await SubjectAPI.getSubjects();
    if (res.subjects != null) {
      state.subjects.clear();
      state.subjects.addAll(res.subjects as Iterable<Subject>);
    }
    await Future.delayed(const Duration(milliseconds: 200));
    state.isLoading.value = false;
  }

  goSubjectPage({required Subject subject}) {
    Get.toNamed(AppRoutes.subjectPage,
        parameters: subject.toJson());
  }
}
