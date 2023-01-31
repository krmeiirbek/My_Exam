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

class TabletScreen extends GetView<AuthController> {
  const TabletScreen({
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
    return Padding(
      padding: EdgeInsets.all(UIParameters.mobileScreenPadding * 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/splash.svg',
                        width: size.width / 4,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Form(
                    key: controller.signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          createAccount.tr,
                          style: title1.copyWith(fontSize: 40),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          createAnAccountToContinue.tr,
                          style:
                              subtitle2.copyWith(color: secondaryTextColor()),
                        ),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: emailController,
                          style: title2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Қате email'
                                  : null,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 21,
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        Obx(() => TextFormField(
                              controller: passwordController,
                              obscureText: obscure.value,
                              style: title2,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (password) =>
                                  password != null && password.length < 6
                                      ? 'Кемінде 6 символ болуы керек'
                                      : null,
                              decoration: InputDecoration(
                                labelText: 'Құпия сөз',
                                labelStyle: const TextStyle(
                                  fontSize: 21,
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
                              style: title2,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (verifyPassword) => verifyPassword !=
                                          null &&
                                      verifyPassword != passwordController.text
                                  ? 'Қате сәйкестендіру'
                                  : null,
                              decoration: const InputDecoration(
                                labelText: 'Құпия сөзді қайталау',
                                labelStyle: TextStyle(
                                  fontSize: 21,
                                  color: Color(0xffC3C3C3),
                                ),
                              ),
                            )),
                        const SizedBox(height: 40),
                        Center(
                          child: Obx(() {
                            if (controller.authStatus.value ==
                                AuthStatus.loading) {
                              return SpinKitCircle(
                                color: secondaryColor(),
                                size: 60,
                              );
                            } else {
                              return AppButton(
                                text: signUp.tr,
                                size: const Size(400, 60),
                                style: title2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: subtitle1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(SignIn.routeName);
                    },
                    child: Text(
                      signIn.tr,
                      style: title3.copyWith(color: secondaryColor()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
