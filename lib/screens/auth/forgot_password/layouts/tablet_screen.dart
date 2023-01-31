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

class TabletScreen extends GetView<AuthController> {
  const TabletScreen({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                    key: controller.forgotPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Құпия сөзді қалпына келтіру үшін электрондық хат алыңыз',
                          style: title2,
                          textAlign: TextAlign.center,
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
                                text: 'Құпия сөзді қалпына келтіру',
                                size: const Size(400, 60),
                                style: title3.copyWith(
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
                                  controller.forgotPassword(
                                    emailController.text
                                  );
                                },
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
