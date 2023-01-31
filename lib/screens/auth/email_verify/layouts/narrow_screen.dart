import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../configs/themes/ui_parameters.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../widgets/app_button.dart';

class NarrowScreen extends GetView<AuthController> {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(UIParameters.mobileScreenPadding / 2),
            child: const Text(
              'Электрондық поштаңызға растау хаты жіберілді',
              style: title3,
              textAlign: TextAlign.center,
            ),
          ),
          AppButton(
            text: 'Электрондық поштаға қайта жіберу',
            style: bodyText1.copyWith(color: Colors.white),
            size: const Size(300, 40),
            background: prColor(),
            boxShadow: [
              BoxShadow(
                color: secondaryColor().withOpacity(0.4),
                offset: const Offset(0, 5),
                blurRadius: 15,
              ),
            ],
            onTap: controller.canResendEmail.value
                ? () {
              controller.sendVerificationEmail();
            }
                : null,
          ),
          const SizedBox(height: 10),
          AppButton(
            text: 'Бас тарту',
            style: subtitle2.copyWith(color: prColor()),
            size: const Size(300, 40),
            background: alternateColor(),
            onTap: () => controller.signOut(),
          ),
        ],
      ),
    );
  }
}
