import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/store/store.dart';
import '../../../common/utils/utils.dart';
import 'state.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController();

  final state = ForgotPasswordState();

  final emailController = TextEditingController();

  // final _auth = UserStore.to.auth;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> forgotPassword() async {
    String email = emailController.text.trim();
    state.isLoading(true);
    try {
      // await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Сізге хат жіберілді',
        'Құпия сөзді қалпына келтіру үшін электрондық хаттығы сілтемеге өтіңіз',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }  catch (e) {
      Get.snackbar(
        'Пайдаланушы жойылған болуы мүмкін.',
        'Бұл идентификаторға сәйкес пайдаланушы жазбасы жоқ',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      // AppLogger.e(e);
    }
    state.isLoading(false);
  }
}
