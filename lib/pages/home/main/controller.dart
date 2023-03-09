import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/values/values.dart';
import 'state.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  @override
  Future<void> onInit() async {
    final user = UserStore.to.profile;
    state.userName.value = user.first_name ?? "";
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

  goToCourseDetails() {
    Get.toNamed(AppRoutes.courseDetails);
  }

  Gradient getGradient(int index) {
    switch ((index % 10)) {
      case 1:
        {
          return gradient1();
        }
      case 2:
        {
          return gradient2();
        }
      case 3:
        {
          return gradient3();
        }
      case 4:
        {
          return gradient4();
        }
      case 5:
        {
          return gradient5();
        }
      case 6:
        {
          return gradient6();
        }
      case 7:
        {
          return gradient7();
        }
      case 8:
        {
          return gradient8();
        }
      case 9:
        {
          return gradient9();
        }
      default:
        {
          return gradient10();
        }
    }
  }

}
