import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/tr_constants.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/terms_of_services.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/sign_up.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset(
            'assets/icons/welcome.svg',
            width: 300,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              welcomeWord.tr,
              textAlign: TextAlign.center,
              style: welcomeTS,
            ),
          ),
          const SizedBox(height: 45),
          AppButton(
            text: signIn.tr,
            style: buttonTS.copyWith(color: Colors.white),
            background: const Color(0xff4785EB),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff599BF0).withOpacity(0.4),
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
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff999999),
            ),
          ),
          const SizedBox(height: 20),
          AppButton(
            text: signUp.tr,
            style: buttonTS.copyWith(color: const Color(0xff589AEF)),
            background: Theme.of(context).primaryColorDark,
            onTap: () {
              Get.toNamed(SignUp.routeName);
            },
          ),
          MediaQuery.of(context).size.height > 700
              ? const Spacer()
              : const SizedBox(height: 30),
          termsOfServices(fSize: 13.0),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
