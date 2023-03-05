import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controller.dart';

class NarrowScreen extends GetView<HomeController> {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: controller.state.pages,
      items: controller.state.navBarItems(context),
      padding: const NavBarPadding.symmetric(vertical: 17),
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
