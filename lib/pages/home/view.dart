import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../common/values/values.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: controller.state.pages,
      items: controller.state.navBarItems,
      backgroundColor: secondaryBackground(),
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
