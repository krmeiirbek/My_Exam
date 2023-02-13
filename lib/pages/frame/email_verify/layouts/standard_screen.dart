import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class StandardScreen extends GetView<EmailVerifyController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(UIParameters.mobileScreenPadding),
            child: const Text(
              'Электрондық поштаңызға растау хаты жіберілді',
              style: title3,
              textAlign: TextAlign.center,
            ),
          ),
          AppButton(
            text: 'Электрондық поштаға қайта жіберу',
            style: subtitle2.copyWith(color: Colors.white),
            size: const Size(300, 50),
            background: prColor(),
            boxShadow: [
              BoxShadow(
                color: secondaryColor().withOpacity(0.4),
                offset: const Offset(0, 5),
                blurRadius: 15,
              ),
            ],
            onTap: controller.state.canResendEmail.value
                ? () {
                    controller.sendVerificationEmail();
                  }
                : null,
          ),
          const SizedBox(height: 10),
          AppButton(
            text: 'Бас тарту',
            style: subtitle2.copyWith(color: prColor()),
            size: const Size(300, 50),
            background: alternateColor(),
            onTap: () => controller.signOut(),
          ),
        ],
      ),
    );
  }
}
