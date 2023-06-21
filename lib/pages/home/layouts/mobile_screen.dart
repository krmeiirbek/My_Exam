import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controller.dart';

class MobileScreen extends GetView<HomeController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: controller.state.pages,
        items: controller.state.navBarItems(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
