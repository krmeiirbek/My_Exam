import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class CourseDetailsPage extends GetView<CourseDetailsController> {
  const CourseDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: MobileScreen(),
        tablet: TabletScreen(),
        web: WebScreen(),
      ),
    );
  }
}
