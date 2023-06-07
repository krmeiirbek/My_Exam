import 'dart:ui';

import 'package:get/get.dart';

import '../services/services.dart';
import '../values/values.dart';

class LanguageStore extends GetxController {
  static LanguageStore get to => Get.find();

  final _language = "".obs;
  final _country = "".obs;

  Locale get locale => Locale(_language.value, _country.value);

  @override
  void onInit() {
    _language.value = StorageService.to.getString(storageLanguageCode);
    _country.value = StorageService.to.getString(storageCountryCode);
    super.onInit();
  }

  void setLanguage(Locale locale) async {
    await StorageService.to.setString(storageLanguageCode, locale.languageCode);
    await StorageService.to
        .setString(storageCountryCode, locale.countryCode ?? "");
  }
}
