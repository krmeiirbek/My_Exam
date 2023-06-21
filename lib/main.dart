import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/langs/langs.dart';
import 'common/store/store.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Global.defaultSize(),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: TranslationService(),
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          debugShowCheckedModeBanner: false,
          theme: Get.find<ThemeStore>().lightTheme,
          darkTheme: Get.find<ThemeStore>().darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.home,
          getPages: AppPages.routes(),
        );
      }
    );
  }
}
