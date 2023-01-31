import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../configs/themes/ui_parameters.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../widgets/app_button.dart';
import '../../components/email_validator.dart';

class NarrowScreen extends GetView<AuthController> {
  const NarrowScreen({
    Key? key,
    required this.emailController,
  }) : super(key: key);
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIParameters.mobileScreenPadding / 2),
        child: Form(
          key: controller.forgotPasswordFormKey,
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
                  const Text(
                    'Құпия сөзді қалпына келтіру үшін электрондық хат алыңыз',
                    style: subtitle1,
                    textAlign: TextAlign.center,
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
                    text: 'Құпия сөзді қалпына келтіру',
                    style: subtitle2.copyWith(
                        color: Colors.white),
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
                      controller.forgotPassword(
                        emailController.text
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
