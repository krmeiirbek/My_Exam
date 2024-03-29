import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileScreen(),
      tablet: TabletScreen(),
      web: WebScreen(),
    );
  }
}
