import 'dart:ui';

import 'package:get/get.dart';

import '../services/services.dart';
import '../values/values.dart';

class LanguageStore extends GetxController {
  static LanguageStore get to => Get.find();

  final _language = "kz".obs;
  final _country = "KZ".obs;

  Locale get locale => Locale(_language.value, _country.value);

  @override
  void onInit() {
    var languageCode = StorageService.to.getString(storageLanguageCode);
    var countryCode = StorageService.to.getString(storageCountryCode);
    if (languageCode == '') {
    } else {
      _language.value = languageCode;
      _country.value = countryCode;
    }

    super.onInit();
  }

  Future<void> setLanguage(Locale locale) async {
    await StorageService.to.setString(storageLanguageCode, locale.languageCode);
    await StorageService.to
        .setString(storageCountryCode, locale.countryCode ?? "");
    _language.value = locale.languageCode;
    _country.value = locale.countryCode ?? "";
  }
}
