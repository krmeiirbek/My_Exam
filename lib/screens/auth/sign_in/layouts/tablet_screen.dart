import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../widgets/app_button.dart';
import '../../../home/home.dart';
import '../../sign_up/sign_up.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          size.height > 450 ?
          const Expanded(child: SizedBox()) : const SizedBox(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/splash.svg',
                      width: size.width / 4,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Қош келдіңіз',
                        style: TextStyle(
                            fontSize: 40,
                            color: Color(0xff3D3D74),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF UI Display'),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Жалғастыру үшін жүйеге кіріңіз',
                        style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontFamily: 'SF UI Display'),
                      ),
                      const SizedBox(height: 35),
                      const TextField(
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'SF UI Display',
                          color: Color(0xff3D3D74),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 21,
                            fontFamily: 'SF UI Display',
                            color: Color(0xffC3C3C3),
                          ),
                        ),
                      ),
                      Obx(() => TextField(
                        obscureText: obscure.value,
                        style: const TextStyle(
                          fontSize: 21,
                          fontFamily: 'SF UI Display',
                          color: Color(0xff3D3D74),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 21,
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
                                color: obscure.value
                                    ? null
                                    : const Color(0xff4785EB),
                              ),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(height: 40),
                      Center(
                        child: AppButton(
                          text: 'Кіру',
                          height: 60,
                          width: double.infinity,
                          style:
                          buttonTS.copyWith(color: Colors.white, fontSize: 22),
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
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 0, top: 6),
                            child: Text(
                              'Құпия сөзді ұмыттыңыз ба?',
                              style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          size.height > 450 ?
          const Expanded(flex: 2,child: SizedBox()) : const SizedBox(height: 30),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Есептік жазбаңыз жоқ па? ',
                  style: TextStyle(
                    color: Color(0xffC3C3C3),
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(SignUp.routeName);
                  },
                  child: const Text(
                    'Қазір жасау',
                    style: TextStyle(
                      color: Color(0xff3C8DEF),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}