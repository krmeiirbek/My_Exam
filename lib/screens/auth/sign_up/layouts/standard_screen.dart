import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/tr_constants.dart';

import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../widgets/app_button.dart';
import '../../../home/home.dart';
import '../../sign_in/sign_in.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return SingleChildScrollView(
      child: Padding(
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
              createAccount.tr,
              style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              createAnAccountToContinue.tr,
              style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 13,),
            ),
            const SizedBox(height: 35),
            const TextField(
              style: TextStyle(
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xffC3C3C3),
                ),
              ),
            ),
            Obx(() => TextField(
                  obscureText: obscure.value,
              style: const TextStyle(
              ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
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
                          color: obscure.value ? null : const Color(0xff4785EB),
                        ),
                      ),
                    ),
                  ),
                )),
            Obx(() => TextField(
                  obscureText: obscure.value,
                  decoration: const InputDecoration(
                    labelText: 'Verify Password',
                    labelStyle: TextStyle(
                      color: Color(0xffC3C3C3),
                    ),
                  ),
                )),
            const SizedBox(height: 40),
            AppButton(
              text: signUp.tr,
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
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 6),
                  child: Text(
                    alreadyHaveAnAccount.tr,
                    style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 15,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 6),
                  child: InkWell(
                    onTap: () {
                      Get.offNamed(SignIn.routeName);
                    },
                    child: Text(
                      signIn.tr,
                      style: const TextStyle(
                        color: Color(0xff3D3D74),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
