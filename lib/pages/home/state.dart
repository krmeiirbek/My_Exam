import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'main/index.dart';
import 'my_courses/index.dart';
import 'notice/index.dart';
import 'profile/index.dart';
import 'leaderboard/index.dart';

class HomeState {
  final currentPageIndex = 0.obs;

  final List<Widget> pages = [
    const MainPage(),
    const LeaderboardPage(),
    const MyCoursesPage(),
    const NoticePage(),
    const ProfilePage(),
  ];

  final List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_home.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/home.svg",
        color: unselectedIconColor(),
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_surface.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/surface.svg",
        color: unselectedIconColor(),
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_my_course.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/my_course.svg",
        color: unselectedIconColor(),
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_clock.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/clock.svg",
        color: unselectedIconColor(),
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/icons/active_user.svg",
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/icons/user.svg",
        color: unselectedIconColor(),
      ),
    ),
  ];
}
