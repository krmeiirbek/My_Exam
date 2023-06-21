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

class MobileScreen extends GetView<SignUpController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIParameters.mobileScreenPadding.w),
        child: Form(
          key: controller.state.formKeySignUp,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: Hero(
                      tag: 'tag-1',
                      child: SvgPicture.asset(
                        'assets/icons/splash.svg',
                        width: 110.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    createAccount.tr,
                    style: headlineMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    createAnAccountToContinue.tr,
                    style: labelMedium.copyWith(
                        color: Theme.of(context).unselectedWidgetColor),
                  ),
                  SizedBox(height: 30.h),
                  TextFormField(
                    controller: controller.nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) => name == "" ? name1.tr : null,
                    decoration: InputDecoration(
                      labelText: name2.tr,
                      labelStyle: const TextStyle(
                        color: Color(0xffC3C3C3),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.surnameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (surname) => surname == "" ? surname1.tr : null,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => email != null && !duIsEmail(email)
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              controller.state
                                  .obscure1(!controller.state.obscure1.value);
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (verifyPassword) => verifyPassword != null &&
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
                              controller.state
                                  .obscure2(!controller.state.obscure2.value);
                            },
                            color: controller.state.obscure2.value
                                ? Theme.of(context).unselectedWidgetColor
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )),
                  SizedBox(height: 40.h),
                ],
              ),
              Obx(() {
                if (controller.state.isLoading.value) {
                  return SpinKitCircle(
                    color: Theme.of(context).colorScheme.primary,
                    size: 50.h,
                  );
                } else {
                  return AppButton(
                    text: signUp.tr,
                    style: titleMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    size: Size(270.w, 50.h),
                    background: Theme.of(context).colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
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
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: bodySmall.copyWith(
                        color: Theme.of(context).unselectedWidgetColor),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      signIn.tr,
                      style: bodySmall.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600
                      ),
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
