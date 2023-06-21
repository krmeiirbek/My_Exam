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

class TabletScreen extends GetView<ForgotPasswordController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(forgotPassword2.tr),
      ),
      body: Padding(
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
                          transitionOnUserGestures: true,
                          child: Container(
                            color: Theme.of(context).colorScheme.background,
                            child: SvgPicture.asset(
                              'assets/icons/splash.svg',
                              width: 200.w,
                            ),
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
                            forgotPassword3.tr,
                            style: headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 35.h),
                          TextFormField(
                            controller: controller.emailController,
                            style: headlineSmall,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                  text: forgotPassword4.tr,
                                  size: Size(400.w, 60.h),
                                  style: titleLarge.copyWith(
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
                                    controller.forgotPassword();
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
      ),
    );
  }
}
