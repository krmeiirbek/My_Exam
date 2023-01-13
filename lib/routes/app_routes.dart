import 'package:get/get.dart';
import 'package:my_exam/screens/auth/sign_in/sign_in.dart';
import 'package:my_exam/screens/auth/sign_up/sign_up.dart';
import 'package:my_exam/screens/home/home.dart';
import 'package:my_exam/screens/home/home_page/exam_page/exam_page.dart';
import 'package:my_exam/screens/welcome/welcome_screen.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: WelcomeScreen.routeName,
          page: () => const WelcomeScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1),
          showCupertinoParallax: false,
        ),
        GetPage(
          name: SignIn.routeName,
          page: () => const SignIn(),
        ),
        GetPage(
          name: SignUp.routeName,
          page: () => const SignUp(),
        ),
        GetPage(
          name: Home.routeName,
          page: () => const Home(),
        ),
        GetPage(
          name: '/home_page/exam_page',
          page: () => ExamPage(),
        ),
      ];
}
