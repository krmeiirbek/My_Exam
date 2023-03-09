import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'common/langs/langs.dart';
import 'common/store/store.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: const Locale('kz', 'KZ'),
      fallbackLocale: const Locale('ru', 'RU'),
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeStore>().lightTheme,
      darkTheme: Get.find<ThemeStore>().darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes(),
    );
  }
}
