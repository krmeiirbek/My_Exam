import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/routes/routes.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../components/components.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              'assets/icons/welcome.svg',
              width: 500,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                welcomeWord.tr,
                textAlign: TextAlign.center,
                style: title1,
              ),
            ),
            const SizedBox(height: 45),
            AppButton(
              text: signIn.tr,
              style: title2.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
              background: prColor(),
              size: const Size(400, 60),
              boxShadow: [
                BoxShadow(
                  color: secondaryColor().withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
              onTap: () {
                Get.toNamed(AppRoutes.signIn);
              },
            ),
            const SizedBox(height: 20),
            Text(
              doYouHaveAnAccount.tr,
              style: title3.copyWith(color: secondaryTextColor()),
            ),
            const SizedBox(height: 30),
            AppButton(
              text: signUp.tr,
              style:
              title2.copyWith(color: secondaryColor(), fontWeight: FontWeight.bold),
              background: alternateColor(),
              size: const Size(400, 60),
              onTap: () {
                Get.toNamed(AppRoutes.signUp);
              },
            ),
          ],
        ),
        Column(
          children: [
            termsOfServices(style: title3.copyWith(color: secondaryTextColor())),
            const SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}