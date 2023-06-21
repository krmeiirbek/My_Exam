import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../index.dart';

class TabletScreen extends GetView<WelcomeController> {
  const TabletScreen({Key? key}) : super(key: key);

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
                  width: 300.w,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "My Exam",
                style: displayMedium.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: controller.goToAuth,
                child: Text(
                  button1.tr,
                  style: titleMedium.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
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
                            style: displaySmall.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: Container(
                            padding: EdgeInsets.all(10.h),
                            width: 300.w,
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
                                    style: titleLarge.copyWith(
                                        color: Colors.white,
                                    ),
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
                  style: titleSmall,
                ),
              ),
              SizedBox(height: 25.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: terms1.tr,
                    ),
                    TextSpan(
                      text: terms2.tr,
                      style: titleSmall.copyWith(
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
                    )
                  ],
                  style: titleSmall.copyWith(
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
