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
import '../controller.dart';

class MobileScreen extends GetView<ForgotPasswordController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(forgotPassword2.tr),
      ),
      body: SingleChildScrollView(
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
                      forgotPassword3.tr,
                      style: titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35.h),
                    TextFormField(
                      controller: controller.emailController,
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
                      text: forgotPassword4.tr,
                      style: labelLarge.copyWith(color: Colors.white),
                      size: Size(270.w, 50.h),
                      background: Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}
