import 'package:get/get.dart';

import '../screens/auth/email_verify/email_verify.dart';
import '../screens/auth/forgot_password/forgot_password.dart';
import '../screens/auth/sign_in/sign_in.dart';
import '../screens/auth/sign_up/sign_up.dart';
import '../screens/home/home.dart';
import '../screens/home/home_page/subject_page/subject_page.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const WelcomeScreen(),
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
          name: ForgotPassword.routeName,
          page: () => const ForgotPassword(),
        ),
        GetPage(
          name: EmailVerify.routeName,
          page: () => const EmailVerify(),
        ),
        GetPage(
          name: Home.routeName,
          page: () => const Home(),
        ),
        GetPage(
          name: '/home_page/subject_page',
          page: () => SubjectPage(),
        ),
      ];
}
