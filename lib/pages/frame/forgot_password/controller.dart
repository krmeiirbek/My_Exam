import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/langs/langs.dart';

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
    state.isLoading(true);
    try {
      // await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        sendMessage1.tr,
        sendMessage2.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }  catch (e) {
      Get.snackbar(
        userCanDeleted.tr,
        noUser.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
    state.isLoading(false);
  }
}
