import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/store/language.dart';

import '../../../common/routes/routes.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  final state = WelcomeState();

  void goToAuth() {
    Get.toNamed(AppRoutes.signIn);
  }

  void changeLocale(String locale) async {
    var code = locale.split('_');
    Get.back();
    Get.updateLocale(Locale(code[0], code[1]));
    await LanguageStore.to.setLanguage(Locale(code[0], code[1]));
  }
}
