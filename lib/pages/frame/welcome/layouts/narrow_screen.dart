import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/routes/routes.dart';
import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../components/components.dart';

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
                horizontal: UIParameters.mobileScreenPadding,
              ),
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
                Get.toNamed(AppRoutes.signIn);
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
                Get.toNamed(AppRoutes.signUp);
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
