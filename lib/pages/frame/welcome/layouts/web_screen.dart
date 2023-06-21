import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../index.dart';

class WebScreen extends GetView<WelcomeController> {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIParameters.mobileScreenPadding.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'tag-1',
                child: SvgPicture.asset(
                  "assets/icons/splash.svg",
                  width: 150.w,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "My Exam",
                style: displayLarge.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(width: 50.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.goToAuth,
                child: Text(
                  button1.tr,
                  style: headlineMedium.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              SizedBox(height: 25.h),
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
                            textAlign: TextAlign.center,
                            style: displayMedium.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          content: Container(
                            padding: EdgeInsets.all(50.h),
                            width: 400.w,
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
                                    textAlign: TextAlign.center,
                                    style: headlineMedium.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
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
                  style: titleLarge,
                ),
              ),
              SizedBox(height: 50.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: terms1.tr,
                    ),
                    TextSpan(
                      text: terms2.tr,
                      style: titleLarge.copyWith(
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
                  style: titleLarge.copyWith(
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
