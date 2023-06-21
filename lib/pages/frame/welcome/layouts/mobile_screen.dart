import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../index.dart';

class MobileScreen extends GetView<WelcomeController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIParameters.mobileScreenPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: double.infinity),
          Column(
            children: [
              Hero(
                tag: 'tag-1',
                child: SvgPicture.asset(
                  "assets/icons/splash.svg",
                  width: 150.w,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "My Exam",
                style: headlineLarge.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            children: [
              AppButton(
                text: button1.tr,
                style: titleSmall.copyWith(color: Colors.white),
                size: Size(270.w, 40.h),
                background: Theme.of(context).colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                  ),
                ],
                onTap: controller.goToAuth,
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          title: Text(
                            choiceLang.tr,
                            style: titleLarge.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          content: Container(
                            padding: EdgeInsets.all(10.h),
                            width: double.maxFinite,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.changeLocale(TranslationService()
                                        .keys
                                        .keys
                                        .elementAt(index));
                                  },
                                  child: Text(
                                    TranslationService()
                                        .keys
                                        .values
                                        .elementAt(index)
                                        .values
                                        .first,
                                    style:
                                        bodyLarge.copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: accent1Color(),
                                );
                              },
                              itemCount: TranslationService().keys.length,
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  button2.tr,
                  style: labelLarge,
                ),
              ),
              SizedBox(height: 25.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: terms1.tr,
                      style: bodySmall,
                    ),
                    TextSpan(
                      text: terms2.tr,
                      style: bodySmall.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          //TODO: open terms of services file
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'hello world',
                                style: TextStyle(
                                  color: primaryTextColor(),
                                ),
                              ),
                              duration: const Duration(milliseconds: 3000),
                              backgroundColor: infoColor(),
                            ),
                          );
                        },
                    ),
                    TextSpan(
                      text: terms3.tr,
                      style: bodySmall,
                    )
                  ],
                  style: bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
