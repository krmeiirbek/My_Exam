import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/langs/langs.dart';
import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import 'state.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    final isValid = state.formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    state.isLoading(true);
    try {
      CheckEmailRequestEntity checkEmail = CheckEmailRequestEntity();
      print(email);
      checkEmail.email = email;
      var checkEmailRes = await UserAPI.checkEmail(params: checkEmail);
      print(checkEmailRes.exists);
      if (checkEmailRes.exists ?? false) {
        LoginOrRegisterRequestEntity login = LoginOrRegisterRequestEntity();
        login.email = email;
        login.password = password;
        var res = await UserAPI.login(params: login);
        if (res.token != null) {
          await UserStore.to.saveProfile(res.user!, res.token!);
          Get.offAllNamed(AppRoutes.home);
        }
      } else {
        Get.snackbar(
          errorInSignIn.tr,
          emailDoNotRegistered.tr,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        errorInSignIn.tr,
        '$e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
    state.isLoading(false);
  }
}
