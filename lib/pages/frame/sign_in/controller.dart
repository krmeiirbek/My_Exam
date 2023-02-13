import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/utils.dart';
import 'state.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = UserStore.to.auth;

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
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? displayName = _auth.currentUser!.displayName;
      String id = _auth.currentUser!.uid;
      String photoUrl =
          _auth.currentUser!.photoURL ?? 'assets/images/avatar.png';

      LoginRequestEntity loginRequestEntity = LoginRequestEntity();
      loginRequestEntity.name = displayName;
      loginRequestEntity.email = email;
      loginRequestEntity.open_id = id;
      loginRequestEntity.avatar = photoUrl;
      loginRequestEntity.type = 1;
      if (kDebugMode) {
        print(jsonEncode(loginRequestEntity));
      }
      asyncPostAllData(loginRequestEntity);

      if (!_auth.currentUser!.emailVerified) {
        Get.toNamed(AppRoutes.emailVerify);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Кіру кезіндегі қателік',
        'Email немесе құпия сөз қате енгізілді',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
      AppLogger.e(e);
    } catch (e) {
      AppLogger.e(e);
    }
    state.isLoading(false);
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    var result = await UserAPI.login(params: loginRequestEntity);
    print(result.code);
    if (result.code == 0) {
      UserStore.to.saveProfile(result.data!);
    } else {
      Get.snackbar(
        result.code.toString(),
        result.msg.toString(),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
    Get.offAllNamed(AppRoutes.home);
  }
}
