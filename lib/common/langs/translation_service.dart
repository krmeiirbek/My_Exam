import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/store/language.dart';

import 'en_US.g.dart';
import 'kz_KZ.g.dart';
import 'ru_RU.g.dart';

class TranslationService extends Translations {
  static Locale? get locale => LanguageStore.to.locale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'kz_KZ': kzKZ,
        'en_US': enUS,
        'ru_RU': ruRU,
      };
}
