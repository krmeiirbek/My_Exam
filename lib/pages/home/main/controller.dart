import 'package:get/get.dart';

import '../../../common/apis/apis.dart';
import '../../../common/store/store.dart';
import 'state.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  @override
  Future<void> onInit() async {
    final user = UserStore.to.profile;
    state.name.value = user.first_name ?? "";
    await getCourses();
    super.onInit();
  }

  getCourses() async {
    state.isLoading.value = true;
    var res = await CourseAPI.getCourses();
    if(res.courses != null){
      state.courses.clear();
      state.courses.addAll(res.courses!);
    }
    state.isLoading.value = false;
  }
}
