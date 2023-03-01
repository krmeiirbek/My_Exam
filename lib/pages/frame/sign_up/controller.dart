import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import 'state.dart';

class SignUpController extends GetxController {
  SignUpController();

  final state = SignUpState();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final isValid = state.formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    String first_name = nameController.text.trim();
    String last_name = surnameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    state.isLoading(true);
    try {
      CheckEmailRequestEntity checkEmail = CheckEmailRequestEntity();
      print(email);
      checkEmail.email = email;
      var checkEmailRes = await UserAPI.checkEmail(params: checkEmail);
      print(checkEmailRes.exists);
      if(!(checkEmailRes.exists ?? true)){
        LoginOrRegisterRequestEntity register = LoginOrRegisterRequestEntity();
        register.email = email;
        register.first_name = first_name;
        register.last_name = last_name;
        register.password = password;
        Get.toNamed(AppRoutes.emailVerify, arguments: register);
      } else {
        Get.snackbar(
          'Тіркелу кезіндегі қателік',
          'Электрондық пошта мекенжайын басқа біреу пайдалануда',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Тіркелу кезіндегі қателік',
        '$e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
    state.isLoading(false);
  }

  // asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  //   var result = await UserAPI.login(params: loginRequestEntity);
  //   if (result.code == 0) {
  //     UserStore.to.saveProfile(result.data!);
  //   } else {
  //     Get.snackbar(
  //       'Internet error',
  //       'Internet error',
  //       snackPosition: SnackPosition.TOP,
  //       duration: const Duration(seconds: 3),
  //     );
  //   }
  //   Get.toNamed(AppRoutes.emailVerify);
  // }
}
