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
    var res = await UserAPI.getMe();
    if (res.user != null) {
      state.me.value = res.user!;
    }
    await Future.delayed(const Duration(milliseconds: 200));
    state.isLoading.value = false;
  }

  void signOut() {
    UserStore.to.onLogout();
  }

  void changeAppLanguage(Locale locale) {
    LanguageStore.to.setLanguage(locale);
  }

}
