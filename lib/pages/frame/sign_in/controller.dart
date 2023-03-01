import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  // final _auth = UserStore.to.auth;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    // 1: email, 2: google, 3: facebook, 4: apple, 5: phone number
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
      if(checkEmailRes.exists ?? false){
        LoginOrRegisterRequestEntity login = LoginOrRegisterRequestEntity();
        login.email = email;
        login.password = password;
        var res = await UserAPI.login(params: login);
        if(res.token != null){
          await UserStore.to.saveProfile(res.user!, res.token!);
          // var getMe = await UserAPI.getMe();
          Get.offAllNamed(AppRoutes.home);
        }
      } else {
        Get.snackbar(
          'Кіру кезіндегі қателік',
          'Email тіркелмеген',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    }  catch (e) {
      Get.snackbar(
        'Кіру кезіндегі қателік',
        '$e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
    state.isLoading(false);
  }

  // asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  //   var result = await UserAPI.login(params: loginRequestEntity);
  //   print(result.code);
  //   if (result.code == 0) {
  //     UserStore.to.saveProfile(result.data!);
  //   } else {
  //     Get.snackbar(
  //       result.code.toString(),
  //       result.msg.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       duration: const Duration(seconds: 3),
  //     );
  //   }
  //   Get.offAllNamed(AppRoutes.home);
  // }
}
