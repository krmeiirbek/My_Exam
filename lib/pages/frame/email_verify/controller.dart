import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import '../../../common/utils/utils.dart';
import 'state.dart';

class EmailVerifyController extends GetxController {
  EmailVerifyController();

  final state = EmailVerifyState();

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    // isEmailVerified = user?.emailVerified;
    if (!state.isEmailVerified.value) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      // await _user.value!.sendEmailVerification();
      state.canResendEmail.value = false;
      await Future.delayed(const Duration(seconds: 5));
      state.canResendEmail.value = true;
    } catch (e) {
      Get.snackbar(
        'Кіру кезіндегі қателік',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future checkEmailVerified() async {
    // await user?.reload();
    // isEmailVerified = user?.emailVerified;
    // update();
    if (state.isEmailVerified.value) {
      timer?.cancel();
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future signOut() async {
    state.isLoading.value = true;
    try {
      // await _auth.signOut();
      Get.offAllNamed(AppRoutes.signIn);
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
    state.isLoading.value = false;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
