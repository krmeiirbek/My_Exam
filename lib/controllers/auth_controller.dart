import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../configs/utils/logger.dart';
import '../screens/auth/email_verify/email_verify.dart';
import '../screens/home/home.dart';
import '../screens/welcome/welcome_screen.dart';

enum AuthStatus {
  authorizedNoVerify,
  authorizedVerify,
  loading,
  notAuthorized,
}

class AuthController extends GetxController {
  final authStatus = AuthStatus.notAuthorized.obs;

  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  final canResendEmail = false.obs;

  void initAuth() async {
    _auth = FirebaseAuth.instance;
  }

  User? get user {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> sendVerificationEmail() async {
    try {
      await _user.value!.sendEmailVerification();

      canResendEmail.value = false;
      await Future.delayed(const Duration(seconds: 5));
      canResendEmail.value = true;
    } catch (e){
      Get.snackbar(
        'Кіру кезіндегі қателік',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future signIn(String email, String password) async {
    final isValid = signInFormKey.currentState?.validate() ?? false;
    if (!isValid) return;
    authStatus.value = AuthStatus.loading;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if(_auth.currentUser!.emailVerified){
        navigateToHomeScreen();
      }else{
        navigateToEmailVerify();
      }
    } on FirebaseAuthException catch (e) {
      authStatus.value = AuthStatus.notAuthorized;
      Get.snackbar(
        'Кіру кезіндегі қателік',
        'Email немесе құпия сөз қате енгізілді',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      AppLogger.e(e);
    } catch (e) {
      authStatus.value = AuthStatus.notAuthorized;
    }
  }

  Future forgotPassword(String email) async {
    authStatus.value = AuthStatus.loading;
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      Get.snackbar(
        'Сізге хат жіберілді',
        'Құпия сөзді қалпына келтіру үшін электрондық хаттығы сілтемеге өтіңіз',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Пайдаланушы жойылған болуы мүмкін.',
        'Бұл идентификаторға сәйкес пайдаланушы жазбасы жоқ',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      AppLogger.e(e);
    }
    authStatus.value = AuthStatus.notAuthorized;
  }

  Future signUp(String email, String password) async {
    final isValid = signUpFormKey.currentState?.validate() ?? false;
    if (!isValid) return;
    authStatus.value = AuthStatus.loading;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      authStatus.value = AuthStatus.authorizedNoVerify;
      navigateToEmailVerify();
    } on FirebaseAuthException catch (e) {
      authStatus.value = AuthStatus.notAuthorized;
      Get.snackbar(
        'Тіркелу кезіндегі қателік',
        'Электрондық пошта мекенжайын басқа біреу пайдалануда',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      AppLogger.e(e);
    } catch (e) {
      authStatus.value = AuthStatus.notAuthorized;
    }
  }

  Future signOut() async {
    authStatus.value = AuthStatus.loading;
    try {
      await _auth.signOut();
      navigateToWelcomeScreen();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
    authStatus.value = AuthStatus.notAuthorized;
  }

  void navigateToHomeScreen() {
    Get.offAllNamed(Home.routeName);
  }

  void navigateToEmailVerify() {
    Get.offAllNamed(EmailVerify.routeName);
  }

  void navigateToWelcomeScreen() {
    Get.offAllNamed(WelcomeScreen.routeName);
  }
}
