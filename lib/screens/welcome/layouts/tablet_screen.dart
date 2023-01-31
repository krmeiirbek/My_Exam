import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../configs/themes/app_colors.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../translation/tr_constants.dart';
import '../../../widgets/app_button.dart';
import '../components/terms_of_services.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/sign_up.dart';

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
                Get.toNamed(SignIn.routeName);
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
                Get.toNamed(SignUp.routeName);
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
