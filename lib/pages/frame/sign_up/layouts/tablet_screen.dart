import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../../components/components.dart';
import '../controller.dart';

class TabletScreen extends GetView<SignUpController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIParameters.mobileScreenPadding.w * 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Hero(
                        tag:'tag-1',
                        child: SvgPicture.asset(
                          'assets/icons/splash.svg',
                          width: 200.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Form(
                    key: controller.state.formKeySignUp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          createAccount.tr,
                          style: displayMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          createAnAccountToContinue.tr,
                          style:
                              titleSmall.copyWith(color: Theme.of(context).unselectedWidgetColor),
                        ),
                        SizedBox(height: 35.h),
                        TextFormField(
                          controller: controller.nameController,
                          style: titleLarge,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (name) =>
                          name == ""
                              ? name1.tr
                              : null,
                          decoration: InputDecoration(
                            labelText: name2.tr,
                            labelStyle: const TextStyle(
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: controller.surnameController,
                          style: titleLarge,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (surname) =>
                          surname == ""
                              ? surname1.tr
                              : null,
                          decoration: InputDecoration(
                            labelText: surname2.tr,
                            labelStyle: const TextStyle(
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: titleLarge,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !duIsEmail(email)
                                  ? wrongEmail.tr
                                  : null,
                          decoration: InputDecoration(
                            labelText: email1.tr,
                            labelStyle: const TextStyle(
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        Obx(() => TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.state.obscure1.value,
                              style: titleLarge,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (password) =>
                                  password != null && password.length < 6
                                      ? wrongPassword.tr
                                      : null,
                              decoration: InputDecoration(
                                labelText: password1.tr,
                                labelStyle: const TextStyle(
                                  color: Color(0xffC3C3C3),
                                ),
                                suffixIcon: eyeSuffixIcon(
                                  onTap: () {
                                    controller.state.obscure1(!controller.state.obscure1.value);
                                  },
                                  color: controller.state.obscure1.value
                                      ? Theme.of(context).unselectedWidgetColor
                                      : Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            )),
                        Obx(() => TextFormField(
                              controller: controller.verifyPasswordController,
                              obscureText: controller.state.obscure2.value,
                              style: titleLarge,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (verifyPassword) =>
                                  verifyPassword != null &&
                                          verifyPassword !=
                                              controller.passwordController.text
                                      ? passwordDoesNotMatch.tr
                                      : null,
                              decoration: InputDecoration(
                                labelText: repeatPassword.tr,
                                labelStyle: const TextStyle(
                                  color: Color(0xffC3C3C3),
                                ),
                                suffixIcon: eyeSuffixIcon(
                                  onTap: () {
                                    controller.state.obscure2(!controller.state.obscure2.value);
                                  },
                                  color: controller.state.obscure2.value
                                      ? Theme.of(context).unselectedWidgetColor
                                      : Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            )),
                        SizedBox(height: 40.h),
                        Center(
                          child: Obx(() {
                            if (controller.state.isLoading.value) {
                              return SpinKitCircle(
                                color: secondaryColor(),
                                size: 60.h,
                              );
                            } else {
                              return AppButton(
                                text: signUp.tr,
                                size: Size(400.w, 60.h),
                                style: title2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                background: Theme.of(context).colorScheme.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                                    offset: const Offset(0, 5),
                                    blurRadius: 15,
                                  ),
                                ],
                                onTap: () {
                                  controller.signUp();
                                },
                              );
                            }
                          }),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: titleSmall.copyWith(color: Theme.of(context).unselectedWidgetColor),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      signIn.tr,
                      style: titleSmall.copyWith(color: Theme.of(context).colorScheme.primary),
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
