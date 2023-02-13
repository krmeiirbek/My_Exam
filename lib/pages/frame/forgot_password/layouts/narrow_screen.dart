import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class NarrowScreen extends GetView<ForgotPasswordController> {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIParameters.mobileScreenPadding / 2,
        ),
        child: Form(
          key: controller.state.formKey,
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
                    controller: controller.emailController,
                    style: subtitle2,
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
                  const SizedBox(height: 30),
                ],
              ),
              Obx(() {
                if (controller.state.isLoading.value) {
                  return SpinKitCircle(
                    color: secondaryColor(),
                    size: 40,
                  );
                } else {
                  return AppButton(
                    text: 'Құпия сөзді қалпына келтіру',
                    style: subtitle2.copyWith(color: Colors.white),
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
