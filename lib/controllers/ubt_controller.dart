import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/subject.dart';

class UBTController extends GetxController {
  final isLoading = true.obs;
  final subjects = <Subject>[].obs;

  @override
  Future<void> onInit() async {
    await getSubjects();
    super.onInit();
  }

  Future<void> getSubjects() async {
    try {
      isLoading(true);
      final String body = await rootBundle.loadString('assets/db/db.json');
      final decode = json.decode(body);
      subjects.assignAll(
          List<Subject>.from(decode['subjects'].map((e) => Subject.fromJson(e))));
    } finally {
      isLoading(false);
    }
  }
}
