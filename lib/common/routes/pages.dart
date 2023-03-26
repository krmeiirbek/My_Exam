import 'package:get/get.dart';

import '../../pages/frame/welcome/index.dart';
import '../../pages/frame/sign_in/index.dart';
import '../../pages/frame/sign_up/index.dart';
import '../../pages/frame/forgot_password/index.dart';
import '../../pages/frame/email_verify/index.dart';
import '../../pages/home/index.dart';
import '../../pages/home/main/course_details/index.dart';
import '../../pages/home/main/index.dart';
import '../../pages/home/leaderboard/index.dart';
import '../../pages/home/main/subject_page/index.dart';
import '../../pages/home/main/lesson_page/index.dart';
import '../../pages/home/quiz/index.dart';
import '../../pages/home/news/index.dart';
import '../../pages/home/profile/index.dart';
import '../../pages/home/quiz/rules_page/index.dart';
import '../../pages/home/quiz/test_page/index.dart';
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
      bindings: [
        MainBinding(),
        LeaderboardBinding(),
        QuizBinding(),
        NewsBinding(),
        ProfileBinding(),
      ],
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.courseDetails,
      page: () => const CourseDetailsPage(),
      binding: CourseDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.subjectPage,
      page: () => const SubjectPage(),
      binding: SubjectPageBinding(),
    ),
    GetPage(
      name: AppRoutes.lessonPage,
      page: () => const LessonPage(),
      binding: LessonPageBinding(),
    ),
    GetPage(
      name: AppRoutes.testPage,
      page: () => const TestPage(),
      binding: TestPageBinding(),
    ),
    GetPage(
      name: AppRoutes.rulesPage,
      page: () => const RulesPage(),
      binding: RulesPageBinding(),
    ),
  ];
}
