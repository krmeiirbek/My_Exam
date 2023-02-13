import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.g.dart';
import 'kz_KZ.g.dart';
import 'ru_RU.g.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'kz_KZ': kzKZ,
        'ru_RU': ruRU,
      };
}
