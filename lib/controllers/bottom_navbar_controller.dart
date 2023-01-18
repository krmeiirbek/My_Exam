import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home/history_page/history.dart';
import '../screens/home/home_page/home_page.dart';
import '../screens/home/leaderboard_page/leaderboard.dart';
import '../screens/home/profile_page/profile.dart';

class BottomNavbarController extends GetxController {
  final _currentIndex = 0.obs;

  final List<Widget> _pages = [
    const HomePage(),
    const LeaderboardPage(),
    HistoryPage(),
    const ProfilePage(),
  ];

  List<Widget> get pages => _pages;
  int get currentIndex => _currentIndex.value;

  onTap(int index) {
    _currentIndex(index);
    update();
  }

}