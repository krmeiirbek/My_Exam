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
import '../../sign_in/sign_in.dart';

class NarrowScreen extends GetView<AuthController> {
  const NarrowScreen({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.verifyPasswordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIParameters.mobileScreenPadding / 2),
        child: Form(
          key: controller.signUpFormKey,
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
                    createAccount.tr,
                    style: title1.copyWith(fontSize: 27),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    createAnAccountToContinue.tr,
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
                  Obx(() => TextFormField(
                        controller: verifyPasswordController,
                        obscureText: obscure.value,
                        style: subtitle2,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (verifyPassword) =>
                            verifyPassword != null &&
                                    verifyPassword != passwordController.text
                                ? 'Қате сәйкестендіру'
                                : null,
                        decoration: const InputDecoration(
                          labelText: 'Құпия сөзді қайталау',
                          labelStyle: TextStyle(
                            color: Color(0xffC3C3C3),
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
                    text: signUp.tr,
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
                      controller.signUp(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  );
                }
              }),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: bodyText1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(SignIn.routeName);
                    },
                    child: Text(
                      signIn.tr,
                      style: subtitle2.copyWith(color: secondaryColor()),
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
