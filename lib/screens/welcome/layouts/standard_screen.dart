import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../configs/themes/app_colors.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../translation/tr_constants.dart';
import '../../../widgets/app_button.dart';
import '../components/terms_of_services.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/sign_up.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              'assets/icons/welcome.svg',
              width: 300,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UIParameters.mobileScreenPadding),
              child: Text(
                welcomeWord.tr,
                textAlign: TextAlign.center,
                style: title2,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              text: signIn.tr,
              style: title3.copyWith(color: Colors.white),
              size: const Size(270, 50),
              background: prColor(),
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
              style: bodyText1.copyWith(color: secondaryTextColor()),
            ),
            const SizedBox(height: 25),
            AppButton(
              text: signUp.tr,
              style: title3.copyWith(color: secondaryColor()),
              size: const Size(270, 50),
              background: alternateColor(),
              onTap: () {
                Get.toNamed(SignUp.routeName);
              },
            ),
          ],
        ),
        Column(
          children: [
            termsOfServices(
                style: bodyText1.copyWith(color: secondaryTextColor())),
            const SizedBox(height: 15),
          ],
        ),
      ],
    );
  }
}
