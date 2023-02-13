import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController();

  final state = ForgotPasswordState();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> forgotPassword() async {
    String email = emailController.text.trim();
    print("email: $email");
    //   authStatus.value = AuthStatus.loading;
    //   try {
    //     await _auth.sendPasswordResetEmail(email: email.trim());
    //     Get.snackbar(
    //       'Сізге хат жіберілді',
    //       'Құпия сөзді қалпына келтіру үшін электрондық хаттығы сілтемеге өтіңіз',
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: const Duration(seconds: 3),
    //     );
    //   } on FirebaseAuthException catch (e) {
    //     Get.snackbar(
    //       'Пайдаланушы жойылған болуы мүмкін.',
    //       'Бұл идентификаторға сәйкес пайдаланушы жазбасы жоқ',
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: const Duration(seconds: 3),
    //     );
    //     AppLogger.e(e);
    //   }
    //   authStatus.value = AuthStatus.notAuthorized;
  }
}
