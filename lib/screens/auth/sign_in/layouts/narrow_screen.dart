import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/custom_text_styles.dart';
import '../../../../widgets/app_button.dart';
import '../../../home/home.dart';
import '../../sign_up/sign_up.dart';

class NarrowScreen extends StatelessWidget {
  const NarrowScreen({Key? key}) : super(key: key);

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
            height: 40,
            width: size.width,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/icons/splash.svg',
              width: 90,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Қош келдіңіз',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff3D3D74),
                fontWeight: FontWeight.bold,
                fontFamily: 'SF UI Display'),
          ),
          const SizedBox(height: 3),
          const Text(
            'Жалғастыру үшін жүйеге кіріңіз',
            style: TextStyle(
                color: Color(0xff707070),
                fontSize: 11,
                fontFamily: 'SF UI Display'),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontSize: 13,
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
                fontSize: 13,
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
            text: 'Кіру',
            height: 40,
            style: buttonTS.copyWith(color: Colors.white, fontSize: 14),
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
          const SizedBox(height: 10),
          Row(
            children: const [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 0, top: 6),
                child: Text(
                  'Құпия сөзді ұмыттыңыз ба?',
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          size.height > 500
              ? const Spacer()
              : const SizedBox(height: 30),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Есептік жазбаңыз жоқ па? ',
                  style: TextStyle(
                    color: Color(0xffC3C3C3),
                    fontSize: 11,
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
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}