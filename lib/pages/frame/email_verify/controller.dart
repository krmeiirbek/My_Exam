import 'dart:async';

import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/utils.dart';
import 'state.dart';

class EmailVerifyController extends GetxController {
  EmailVerifyController();

  final state = EmailVerifyState();

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    if (!state.isEmailVerified.value) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      // await _auth.currentUser!.sendEmailVerification();
      state.canResendEmail.value = false;
      await Future.delayed(const Duration(seconds: 5));
      state.canResendEmail.value = true;
    } catch (e) {
      Get.snackbar(
        'Кіру кезіндегі қателік',
        '$e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future checkEmailVerified() async {
    // await _auth.currentUser?.reload();
    // state.isEmailVerified.value = _auth.currentUser?.emailVerified ?? false;
    update();
    if (state.isEmailVerified.value) {
      timer?.cancel();
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future signOut() async {
    state.isLoading.value = true;
    try {
      UserStore.to.onLogout();
    }  catch (e) {
      // AppLogger.e(e);
    }
    state.isLoading.value = false;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
