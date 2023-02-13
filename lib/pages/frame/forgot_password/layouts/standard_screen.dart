import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class StandardScreen extends GetView<ForgotPasswordController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UIParameters.mobileScreenPadding),
        child: Form(
          key: controller.state.formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: size.width,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/splash.svg',
                      width: 110,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Құпия сөзді қалпына келтіру үшін электрондық хат алыңыз',
                    style: title3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  TextFormField(
                    controller: controller.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => email != null && !duIsEmail(email)
                        ? 'Қате email'
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xffC3C3C3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              Obx(() {
                if (controller.state.isLoading.value) {
                  return SpinKitCircle(
                    color: secondaryColor(),
                    size: 50,
                  );
                } else {
                  return AppButton(
                    text: 'Құпия сөзді қалпына келтіру',
                    style: subtitle2.copyWith(color: Colors.white),
                    size: const Size(270, 50),
                    background: prColor(),
                    boxShadow: [
                      BoxShadow(
                        color: secondaryColor().withOpacity(0.4),
                        offset: const Offset(0, 5),
                        blurRadius: 15,
                      ),
                    ],
                    onTap: () {
                      controller.forgotPassword();
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
