import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    print("email: $email");
    print("password: $password");
    // authStatus.value = AuthStatus.loading;
    // try {
    //   await _auth.signInWithEmailAndPassword(
    //     email: email.trim(),
    //     password: password.trim(),
    //   );
    //   if(_auth.currentUser!.emailVerified){
    //     navigateToHomeScreen();
    //   }else{
    //     navigateToEmailVerify();
    //   }
    // } on FirebaseAuthException catch (e) {
    //   authStatus.value = AuthStatus.notAuthorized;
    //   Get.snackbar(
    //     'Кіру кезіндегі қателік',
    //     'Email немесе құпия сөз қате енгізілді',
    //     snackPosition: SnackPosition.BOTTOM,
    //     duration: const Duration(seconds: 3),
    //   );
    //   AppLogger.e(e);
    // } catch (e) {
    //   authStatus.value = AuthStatus.notAuthorized;
  }
}
