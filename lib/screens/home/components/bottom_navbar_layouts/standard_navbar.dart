import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/controllers/bottom_navbar_controller.dart';

import '../../../../configs/themes/app_colors.dart';
import '../nav_bar_item.dart';

Widget standardNavbar(BottomNavbarController controller) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
        color: bottomNavBarBackgroundColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ]),
    child: Obx(() => SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navBarItem(
            idx: 0,
            currentIdx: controller.currentIndex,
            onTap: () => controller.onTap(0),
            title: 'Home',
            svg: 'assets/icons/home.svg',
            iconSize: 25,
            fontSize: 10,
          ),
          navBarItem(
            idx: 1,
            currentIdx: controller.currentIndex,
            onTap: () => controller.onTap(1),
            title: 'Leaderboard',
            svg: 'assets/icons/surface.svg',
            iconSize: 25,
            fontSize: 10,
          ),
          navBarItem(
            idx: 2,
            currentIdx: controller.currentIndex,
            onTap: () => controller.onTap(2),
            title: 'History',
            svg: 'assets/icons/clock.svg',
            iconSize: 25,
            fontSize: 10,
          ),
          navBarItem(
            idx: 3,
            currentIdx: controller.currentIndex,
            onTap: () => controller.onTap(3),
            title: 'Profile',
            svg: 'assets/icons/user.svg',
            iconSize: 25,
            fontSize: 10,
          ),
        ],
      ),
    )),
  );
}
