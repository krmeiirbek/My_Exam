import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/index.dart';
import 'my_courses/index.dart';
import 'notice/index.dart';
import 'profile/index.dart';
import 'unt/index.dart';

class HomeState {
  final currentIndex = 0.obs;

  final List<Widget> pages = [
    const MainPage(),
    const UNTPage(),
    const MyCoursesPage(),
    const NoticePage(),
    const ProfilePage(),
  ];
}
