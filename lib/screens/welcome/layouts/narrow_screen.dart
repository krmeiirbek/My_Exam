import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/tr_constants.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/terms_of_services.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/sign_up.dart';

class NarrowScreen extends StatelessWidget {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 15),
          SvgPicture.asset(
            'assets/icons/welcome.svg',
            width: 250,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              welcomeWord.tr,
              textAlign: TextAlign.center,
              style: welcomeTS.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: 25),
          AppButton(
            text: signIn.tr,
            style: buttonTS.copyWith(color: Colors.white, fontSize: 14),
            background: const Color(0xff4785EB),
            width: 250,
            height: 40,
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
          const SizedBox(height: 15),
          Text(
            doYouHaveAnAccount.tr,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xff999999),
            ),
          ),
          const SizedBox(height: 15),
          AppButton(
            text: signUp.tr,
            style:
                buttonTS.copyWith(color: const Color(0xff589AEF), fontSize: 14),
            background: Theme.of(context).primaryColorDark,
            width: 250,
            height: 40,
            onTap: () {
              Get.toNamed(SignUp.routeName);
            },
          ),
          MediaQuery.of(context).size.height > 550
              ? const Spacer()
              : const SizedBox(height: 30),
          termsOfServices(fSize: 13.0),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
