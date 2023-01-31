import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../configs/themes/app_colors.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../translation/tr_constants.dart';
import '../../../widgets/app_button.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/sign_up.dart';
import '../components/terms_of_services.dart';

class NarrowScreen extends StatelessWidget {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              'assets/icons/welcome.svg',
              width: 250,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UIParameters.mobileScreenPadding),
              child: Text(
                welcomeWord.tr,
                textAlign: TextAlign.center,
                style: title3,
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              text: signIn.tr,
              style: subtitle2.copyWith(color: Colors.white),
              background: prColor(),
              size: const Size(250, 40),
              boxShadow: [
                BoxShadow(
                  color: tertiaryColor().withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
              onTap: () {
                Get.toNamed(SignIn.routeName);
              },
            ),
            const SizedBox(height: 10),
            Text(
              doYouHaveAnAccount.tr,
              style: bodyText1.copyWith(color: secondaryTextColor()),
            ),
            const SizedBox(height: 15),
            AppButton(
              text: signUp.tr,
              style: subtitle2.copyWith(color: secondaryColor()),
              background: alternateColor(),
              size: const Size(250, 40),
              onTap: () {
                Get.toNamed(SignUp.routeName);
              },
            ),
          ],
        ),
        Column(children: [
          termsOfServices(style: bodyText2),
          const SizedBox(height: 10),
        ]),
      ],
    );
  }
}
