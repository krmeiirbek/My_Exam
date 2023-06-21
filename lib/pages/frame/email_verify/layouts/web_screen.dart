import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class WebScreen extends GetView<EmailVerifyController> {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(emailVerify1.tr),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(UIParameters.mobileScreenPadding.w * 2),
              child: Text(
                sendMessage3.tr,
                style: headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UIParameters.mobileScreenPadding.w,
              ),
              child: Form(
                key: controller.state.formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 68.h,
                      width: 64.w,
                      child: TextFormField(
                        style: titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {
                          if (v.length == 1) {
                            controller.state.pin1.value = v;
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      height: 68.h,
                      width: 64.w,
                      child: TextFormField(
                        style: titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {
                          if (v.length == 1) {
                            controller.state.pin2.value = v;
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      height: 68.h,
                      width: 64.w,
                      child: TextFormField(
                        style: titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {
                          if (v.length == 1) {
                            controller.state.pin3.value = v;
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      height: 68.h,
                      width: 64.w,
                      child: TextFormField(
                        style: titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {
                          if (v.length == 1) {
                            controller.state.pin4.value = v;
                            FocusScope.of(context).unfocus();
                            controller.checkEmailVerified();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
                  () => AppButton(
                text: controller.state.canResendEmail.value
                    ? sendMessage4.tr
                    : '${controller.state.timeMin}:${controller.state.timeSec}',
                style: titleMedium.copyWith(color: Colors.white),
                size: Size(400.w, 60.h),
                background: Theme.of(context).colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                  ),
                ],
                onTap: controller.state.canResendEmail.value
                    ? () {
                  controller.sendVerificationEmail();
                }
                    : null,
              ),
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: cancel1.tr,
              style: titleMedium.copyWith(color: Colors.white),
              size: Size(400.w, 60.h),
              background: Theme.of(context).colorScheme.tertiary,
              onTap: () => controller.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
