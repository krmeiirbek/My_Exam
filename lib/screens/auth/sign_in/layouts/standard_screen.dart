import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/tr_constants.dart';

import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../widgets/app_button.dart';
import '../../../home/home.dart';
import '../../sign_up/sign_up.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            width: size.width,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/icons/splash.svg',
              width: 110,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            welcomeBack.tr,
            style: const TextStyle(
                fontSize: 34,
                color: Color(0xff3D3D74),
                fontWeight: FontWeight.bold,
                fontFamily: 'SF UI Display'),
          ),
          const SizedBox(height: 3),
          Text(
            signInToContinue.tr,
            style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 13,
                fontFamily: 'SF UI Display'),
          ),
          const SizedBox(height: 35),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontFamily: 'SF UI Display',
                color: Color(0xffC3C3C3),
              ),
            ),
          ),
          Obx(() => TextField(
            obscureText: obscure.value,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: const TextStyle(
                fontFamily: 'SF UI Display',
                color: Color(0xffC3C3C3),
              ),
              suffixIcon: InkWell(
                onTap: () {
                  obscure(!obscure.value);
                },
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/icons/eye.svg',
                    color:
                    obscure.value ? null : const Color(0xff4785EB),
                  ),
                ),
              ),
            ),
          )),
          const SizedBox(height: 40),
          AppButton(
            text: signIn.tr,
            style: buttonTS.copyWith(color: Colors.white),
            width: double.infinity,
            background: const Color(0xff4785EB),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff599BF0).withOpacity(0.4),
                offset: const Offset(0, 5),
                blurRadius: 15,
              ),
            ],
            onTap: () {
              Get.toNamed(Home.routeName);
            },
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 6),
                child: Text(
                  forgotPassword.tr,
                  style: const TextStyle(
                    color: Color(0xff999999),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          size.height > 650
              ? const Spacer()
              : const SizedBox(height: 30),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dontHaveAnAccount.tr,
                  style: const TextStyle(
                    color: Color(0xffC3C3C3),
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(SignUp.routeName);
                  },
                  child: Text(
                    createNow.tr,
                    style: const TextStyle(
                      color: Color(0xff3C8DEF),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}