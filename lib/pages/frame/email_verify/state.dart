import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyState {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final isEmailVerified = false.obs;
  final canResendEmail = false.obs;

  final pin1 = "".obs;
  final pin2 = "".obs;
  final pin3 = "".obs;
  final pin4 = "".obs;

  final timeMin = "00".obs;
  final timeSec = "59".obs;
}