import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();
  final navBarController = PersistentTabController(initialIndex: 0);

  onTap(int index) {
    state.currentPageIndex(index);
    update();
  }
}
