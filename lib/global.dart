import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/services/services.dart';
import 'common/store/store.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// light dark theme controller
    Get.put<ThemeStore>(ThemeStore());

    /// local storage
    await Get.putAsync<StorageService>(() => StorageService().init());

    /// app language controller
    Get.put<LanguageStore>(LanguageStore());

    /// user controller for authorization
    Get.put<UserStore>(UserStore());
  }

  static isMobile() => Get.size.width < 576;

  static isTablet() => Get.size.width >= 576 && Get.size.width < 1280;

  static isWeb() => Get.size.width >= 1280;

  static defaultSize() {
    if(isMobile()) {
      return const Size(375, 825);
    }else if(isTablet()) {
      return const Size(800, 1280);
    } else {
      return const Size(1280, 1920);
    }
  }
}
