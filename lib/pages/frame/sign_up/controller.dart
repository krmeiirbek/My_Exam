import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class SignUpController extends GetxController {
  SignUpController();

  final state = SignUpState();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final isValid = state.formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print("email: $email");
    print("password: $password");
    // authStatus.value = AuthStatus.loading;
    // try {
    //   await _auth.createUserWithEmailAndPassword(
    //     email: email.trim(),
    //     password: password.trim(),
    //   );
    //   authStatus.value = AuthStatus.authorizedNoVerify;
    //   navigateToEmailVerify();
    // } on FirebaseAuthException catch (e) {
    //   authStatus.value = AuthStatus.notAuthorized;
    //   Get.snackbar(
    //     'Тіркелу кезіндегі қателік',
    //     'Электрондық пошта мекенжайын басқа біреу пайдалануда',
    //     snackPosition: SnackPosition.BOTTOM,
    //     duration: const Duration(seconds: 3),
    //   );
    //   AppLogger.e(e);
    // } catch (e) {
    //   authStatus.value = AuthStatus.notAuthorized;
    // }
  }
}
