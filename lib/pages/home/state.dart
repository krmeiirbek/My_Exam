import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'main/index.dart';
import 'quiz/index.dart';
import 'my_courses/index.dart';
import 'profile/index.dart';

class HomeState {
  final currentPageIndex = 0.obs;

  final List<Widget> pages = [
    const MainPage(),
    const MyCoursesPage(),
    const QuizPage(),
    const ProfilePage(),
  ];

  List<PersistentBottomNavBarItem> navBarItems(BuildContext context) => [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          inactiveIcon: Icon(
            CupertinoIcons.home,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.book),
          inactiveIcon: Icon(
            CupertinoIcons.book,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.equalizer_outlined),
          inactiveIcon: Icon(
            Icons.equalizer_outlined,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2_outlined),
          inactiveIcon: Icon(
            Icons.person_2_outlined,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
      ];
}
