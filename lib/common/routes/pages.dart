import 'package:get/get.dart';

import '../../pages/frame/welcome/index.dart';
import '../../pages/frame/sign_in/index.dart';
import '../../pages/frame/sign_up/index.dart';
import '../../pages/frame/forgot_password/index.dart';
import '../../pages/frame/email_verify/index.dart';
import '../../pages/home/index.dart';
import '../../pages/home/main/index.dart';
import '../../pages/home/leaderboard/index.dart';
import '../../pages/home/my_courses/index.dart';
import '../../pages/home/notice/index.dart';
import '../../pages/home/profile/index.dart';
import '../middlewares/middlewares.dart';
import 'names.dart';


class AppPages {
  static List<GetPage> routes() => [
    GetPage(
      name: AppRoutes.initial,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.emailVerify,
      page: () => const EmailVerifyPage(),
      binding: EmailVerifyBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    // GetPage(
    //   name: AppRoutes.main,
    //   page: () => const MainPage(),
    //   binding: MainBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.unt,
    //   page: () => const UNTPage(),
    //   binding: UNTBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.myCourses,
    //   page: () => const MyCoursesPage(),
    //   binding: MyCoursesBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.notice,
    //   page: () => const NoticePage(),
    //   binding: NoticeBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfilePage(),
    //   binding: ProfileBinding(),
    // ),
  ];
}
