import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/apis/apis.dart';
import 'package:my_exam/common/store/store.dart';

import 'state.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  @override
  void onInit() async {
    await getMe();
    super.onInit();
  }

  getMe() async {
    state.isLoading.value = true;
    state.me.value = UserStore.to.profile;
    state.isLoading.value = false;
  }

  void changeLocale(String locale) async {
    var code = locale.split('_');
    Get.back();
    Get.updateLocale(Locale(code[0], code[1]));
    await LanguageStore.to.setLanguage(Locale(code[0], code[1]));
  }

  void signOut() {
    UserStore.to.onLogout();
  }

  void changeAppLanguage(Locale locale) {
    LanguageStore.to.setLanguage(locale);
  }

}
