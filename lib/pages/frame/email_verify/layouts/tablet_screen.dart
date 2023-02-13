import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/style.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class TabletScreen extends GetView<EmailVerifyController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(UIParameters.mobileScreenPadding * 2),
            child: const Text(
              'Электрондық поштаңызға растау хаты жіберілді',
              style: title2,
              textAlign: TextAlign.center,
            ),
          ),
          AppButton(
            text: 'Электрондық поштаға қайта жіберу',
            style: subtitle1.copyWith(color: Colors.white),
            size: const Size(400, 60),
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
          const SizedBox(height: 20),
          AppButton(
            text: 'Бас тарту',
            style: subtitle1.copyWith(color: prColor()),
            size: const Size(400, 60),
            background: alternateColor(),
            onTap: () => controller.signOut(),
          ),
        ],
      ),
    );
  }
}
