import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class TestPage extends GetView<TestPageController> {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        smallMobile: NarrowScreen(),
        mobile: StandardScreen(),
        tablet: TabletScreen(),
      ),
    );
  }
}