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

    /// user controller for authorization
    Get.put<UserStore>(UserStore());
  }

  static isSmallMobile() => Get.size.width < 385;

  static isMobile() => Get.size.width >= 385 && Get.size.width < 576;

  static isTablet() => Get.size.width > 576;
}
