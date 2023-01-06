import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/configs/themes/custom_text_styles.dart';
import 'package:my_exam/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  _navigateToWelcome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offNamed(WelcomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/splash.svg'),
            const SizedBox(height: 12),
            const Text('MyExam', style: splashTS),
            const SizedBox(height: 30),
            Image.asset('assets/images/splash_ellipse.png'),
          ],
        ),
      ),
    );
  }
}
