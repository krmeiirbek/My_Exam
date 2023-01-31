import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../configs/themes/ui_parameters.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../translation/tr_constants.dart';
import '../../../../widgets/app_button.dart';
import '../../components/email_validator.dart';
import '../../components/eyeSuffixIcon.dart';
import '../../forgot_password/forgot_password.dart';
import '../../sign_up/sign_up.dart';

class NarrowScreen extends GetView<AuthController> {
  const NarrowScreen({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIParameters.mobileScreenPadding / 2),
        child: Form(
          key: controller.signInFormKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: size.width,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/splash.svg',
                      width: 90,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    welcomeBack.tr,
                    style: title1.copyWith(fontSize: 27),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    signInToContinue.tr,
                    style: bodyText2.copyWith(color: secondaryTextColor()),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    style: subtitle2,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Қате email'
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xffC3C3C3),
                      ),
                    ),
                  ),
                  Obx(() => TextFormField(
                        controller: passwordController,
                        obscureText: obscure.value,
                        style: subtitle2,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                    password != null && password.length < 6
                        ? 'Кемінде 6 символ болуы керек'
                        : null,
                        decoration: InputDecoration(
                          labelText: 'Құпия сөз',
                          labelStyle: const TextStyle(
                            color: Color(0xffC3C3C3),
                          ),
                          suffixIcon: eyeSuffixIcon(
                            onTap: () {
                              obscure(!obscure.value);
                            },
                            color: obscure.value
                                ? secondaryTextColor()
                                : tertiaryColor(),
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                ],
              ),
              Obx(() {
                if (controller.authStatus.value == AuthStatus.loading) {
                  return SpinKitCircle(
                    color: secondaryColor(),
                    size: 40,
                  );
                } else {
                  return AppButton(
                    text: signIn.tr,
                    style: title3.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    size: const Size(250, 40),
                    background: prColor(),
                    boxShadow: [
                      BoxShadow(
                        color: secondaryColor().withOpacity(0.4),
                        offset: const Offset(0, 5),
                        blurRadius: 15,
                      ),
                    ],
                    onTap: () {
                      controller.signIn(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  );
                }
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(ForgotPassword.routeName);
                    },
                    child: Text(
                      forgotPassword.tr,
                      style: bodyText1.copyWith(color: secondaryTextColor()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dontHaveAnAccount.tr,
                    style: bodyText1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(SignUp.routeName);
                    },
                    child: Text(
                      createNow.tr,
                      style: bodyText1.copyWith(color: secondaryColor()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
