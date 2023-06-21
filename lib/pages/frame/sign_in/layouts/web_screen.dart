import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/routes/routes.dart';
import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../../components/components.dart';
import '../controller.dart';

class WebScreen extends GetView<SignInController> {
  const WebScreen({Key? key}) : super(key: key);

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
                        tag: 'tag-1',
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
                    key: controller.state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          welcomeBack.tr,
                          style: displayMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          signInToContinue.tr,
                          style: titleMedium.copyWith(
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        TextFormField(
                          controller: controller.emailController,
                          style: titleLarge,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                          email != null && !duIsEmail(email)
                              ? wrongEmail.tr
                              : null,
                          decoration: InputDecoration(
                            labelText: email1.tr,
                            labelStyle: titleLarge.copyWith(
                              color: const Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        Obx(() => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.state.obscure.value,
                          style: titleLarge,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          validator: (password) =>
                          password != null && password.length < 6
                              ? wrongPassword.tr
                              : null,
                          decoration: InputDecoration(
                            labelText: password1.tr,
                            labelStyle: titleLarge.copyWith(
                              color: const Color(0xffC3C3C3),
                            ),
                            suffixIcon: eyeSuffixIcon(
                              onTap: () {
                                controller.state.obscure(
                                    !controller.state.obscure.value);
                              },
                              color: controller.state.obscure.value
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
                                color: Theme.of(context).colorScheme.primary,
                                size: 60.h,
                              );
                            } else {
                              return AppButton(
                                text: signIn.tr,
                                size: Size(400.w, 60.h),
                                style: headlineSmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                background:
                                Theme.of(context).colorScheme.primary,
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
                                  controller.signIn();
                                },
                              );
                            }
                          }),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 0, top: 6.h),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.forgotPassword);
                                },
                                child: Text(
                                  forgotPassword.tr,
                                  style: titleMedium.copyWith(
                                      color: Theme.of(context).unselectedWidgetColor),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    dontHaveAnAccount.tr,
                    style: titleMedium.copyWith(color: Theme.of(context).unselectedWidgetColor),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      createNow.tr,
                      style: titleMedium.copyWith(color: Theme.of(context).colorScheme.primary),
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
