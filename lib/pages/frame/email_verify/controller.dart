import 'dart:async';

import 'package:get/get.dart';

import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import 'state.dart';

class EmailVerifyController extends GetxController {
  EmailVerifyController();

  final state = EmailVerifyState();

  late LoginOrRegisterRequestEntity register;

  Timer? timer;
  Duration duration = const Duration(seconds: 59);

  @override
  Future<void> onInit() async {
    super.onInit();
    register = await Get.arguments;
    sendVerificationEmail();
  }

  void decrementTime() {
    duration = Duration(seconds: (duration.inSeconds - 1));
    state.timeSec.value = duration.inSeconds.toString().padLeft(2, '0');
    if (duration.inSeconds == 0) {
      timer?.cancel();
      state.canResendEmail.value = true;
      duration = const Duration(seconds: 59);
      state.timeSec.value = "59";
    }
  }

  Future<void> sendVerificationEmail() async {
    state.canResendEmail.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (_) => decrementTime());
    try {
      print(register.email);
      RegisterSendCodeRequestEntity sendCode = RegisterSendCodeRequestEntity();
      sendCode.email = register.email;
      var res = await UserAPI.sendCode(params: sendCode);
      if (res.message == "sent") {
      } else {
        Get.snackbar(
          'Errors in send code',
          'res.message != sent',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Errors in send code',
        '$e',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future checkEmailVerified() async {
    if (!(state.formKey.currentState.isBlank ?? true)) {
      state.isLoading.value = true;
      RegisterCheckCodeRequestEntity registerCheckCodeRequestEntity =
          RegisterCheckCodeRequestEntity();
      registerCheckCodeRequestEntity.email = register.email;
      registerCheckCodeRequestEntity.code = state.pin1.value +
          state.pin2.value +
          state.pin3.value +
          state.pin4.value;
      var res = await UserAPI.checkCode(params: registerCheckCodeRequestEntity);
      if (res.success ?? false) {
        var res2 = await UserAPI.register(params: register);
        if(res2.token != null){
          await UserStore.to.saveProfile(res2.user!, res2.token!);
          Get.offAllNamed(AppRoutes.home);
        }
      }else{
        state.formKey.currentState.printError(
          info: "error code",
        );
        state.formKey.currentState?.reset();
      }
      state.isLoading.value = false;
    }
  }

  Future signOut() async {
    state.isLoading.value = true;
    try {
      UserStore.to.onLogout();
    } catch (e) {
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
