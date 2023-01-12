import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_exam/models/user.dart';

class LeaderboardController extends GetxController {
  final isLoading = true.obs;
  final users = <User>[].obs;

  @override
  Future<void> onInit() async {
    await getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      isLoading(true);
      final String body = await rootBundle.loadString('assets/db/users.json');
      final decode = json.decode(body);
      users.assignAll(
          List<User>.from(decode['users'].map((e) => User.fromJson(e))));
    } finally {
      isLoading(false);
    }
  }
}
