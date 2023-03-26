import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class RulesPage extends GetView<RulesPageController> {
  const RulesPage({Key? key}) : super(key: key);

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