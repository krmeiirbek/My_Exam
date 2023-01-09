import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../controllers/bottom_navbar_controller.dart';
import 'components/bottom_navbar_layouts/narrow_navbar.dart';
import 'components/bottom_navbar_layouts/standard_navbar.dart';
import 'components/bottom_navbar_layouts/tablet_navbar.dart';

class Home extends GetView<BottomNavbarController> {
  const Home({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground(),
      body: Obx(() => controller.pages[controller.currentIndex]),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraint){
          if (constraint.maxWidth > 600) {
            return tabletNavbar(controller);
          } else if (constraint.maxWidth > 385) {
            return standardNavbar(controller);
          } else {
            return narrowNavbar(controller);
          }
        },
      ),
    );
  }
}


