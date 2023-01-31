import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/translation.dart';

import 'bindings/initial_bindings.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent
  //   )
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: const Locale('kz', 'KZ'),
      fallbackLocale: const Locale('ru', 'RU'),
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      darkTheme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
