import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/terms_of_services.dart';
import '../../auth/sign_in.dart';
import '../../auth/sign_up.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset(
            'assets/icons/welcome.svg',
            width: 500,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'ҰБТ-ға бізбен бірге дайындал! Біз саған 1000-нан астам жаңа тест нұсқаларымен тапсырмаларын ұсынамыз.',
              textAlign: TextAlign.center,
              style: welcomeTS,
            ),
          ),
          const SizedBox(height: 45),
          AppButton(
            text: 'Кіру',
            style: buttonTS.copyWith(color: Colors.white, fontSize: 22),
            background: const Color(0xff4785EB),
            height: 70,
            width: 500,
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
          const SizedBox(height: 30),
          const Text(
            'Есептік жазбаңыз бар ма?',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff999999),
            ),
          ),
          const SizedBox(height: 30),
          AppButton(
            text: 'Тіркелу',
            style:
                buttonTS.copyWith(color: const Color(0xff589AEF), fontSize: 22),
            background: Theme.of(context).primaryColorDark,
            height: 70,
            width: 500,
            onTap: () {
              Get.toNamed(SignUp.routeName);
            },
          ),
          MediaQuery.of(context).size.height > 700
              ? const Spacer()
              : const SizedBox(height: 30),
          termsOfServices(fSize: 18.0),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}