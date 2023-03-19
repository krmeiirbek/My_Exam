import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'main/index.dart';
import 'quiz/index.dart';
import 'news/index.dart';
import 'profile/index.dart';
import 'leaderboard/index.dart';

class HomeState {
  final currentPageIndex = 0.obs;

  final List<Widget> pages = [
    const MainPage(),
    const QuizPage(),
    const NewsPage(),
    const LeaderboardPage(),
    const ProfilePage(),
  ];

  List<PersistentBottomNavBarItem> navBarItems(BuildContext context) => [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_home.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/home.svg",
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_my_course.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/my_course.svg",
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_clock.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/clock.svg",
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_surface.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/surface.svg",
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_user.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/user.svg",
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      ),
    ),
  ];
}
