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

class MobileScreen extends GetView<SignInController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIParameters.mobileScreenPadding.w,
        ),
        child: Form(
          key: controller.state.formKey,
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
                    welcomeBack.tr,
                    style: headlineLarge.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    signInToContinue.tr,
                    style: bodySmall.copyWith(
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                  ),
                  SizedBox(height: 35.h),
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
                        obscureText: controller.state.obscure.value,
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
                                  .obscure(!controller.state.obscure.value);
                            },
                            color: controller.state.obscure.value
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
                    text: signIn.tr,
                    style: titleSmall.copyWith(
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
                    onTap: controller.signIn,
                  );
                }
              }),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: Text(
                      forgotPassword.tr,
                      style: labelMedium.copyWith(
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dontHaveAnAccount.tr,
                    style: labelMedium.copyWith(
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      createNow.tr,
                      style: labelMedium.copyWith(
                        color: Theme.of(context).colorScheme.primary,
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
