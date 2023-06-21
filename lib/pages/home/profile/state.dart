import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/entities/entities.dart';

class ProfileState {
  final isLoading = false.obs;

  final appLanguage = {
    "Қазақша (Kazakh)": const Locale('kz','KZ'),
    "Русский (Russian)": const Locale('ru','RU'),
    "English (English)": const Locale('en','US'),
  };

  final me = UserItem().obs;
}