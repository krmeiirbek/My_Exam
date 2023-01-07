import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/translation.dart';

import 'bindings/initial_bindings.dart';
import 'controllers/theme_controller.dart';
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: const Locale('kz','KZ'),
      fallbackLocale: const Locale('ru','RU'),
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      darkTheme: Get.find<ThemeController>().darkTheme,
      themeMode: ThemeMode.light,
      getPages: AppRoutes.routes(),
      initialRoute: '/',
    );
  }
}
