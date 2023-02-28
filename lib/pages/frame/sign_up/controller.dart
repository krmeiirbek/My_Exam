import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/utils.dart';
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
    state.isLoading(true);
    try {
      // await _auth.createUserWithEmailAndPassword(
      //   email: email.trim(),
      //   password: password.trim(),
      // );
      //
      // String? displayName = _auth.currentUser!.displayName;
      // String id = _auth.currentUser!.uid;
      // String photoUrl =
      //     _auth.currentUser!.photoURL ?? 'assets/images/avatar.png';
      //
      // LoginRequestEntity loginRequestEntity = LoginRequestEntity();
      // loginRequestEntity.name = displayName;
      // loginRequestEntity.email = email;
      // loginRequestEntity.open_id = id;
      // loginRequestEntity.avatar = photoUrl;
      // loginRequestEntity.type = 1;
      // if (kDebugMode) {
      //   print(jsonEncode(loginRequestEntity));
      // }
      // asyncPostAllData(loginRequestEntity);
    } catch (e) {
      Get.snackbar(
        'Тіркелу кезіндегі қателік',
        'Электрондық пошта мекенжайын басқа біреу пайдалануда',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      // AppLogger.e(e);
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
