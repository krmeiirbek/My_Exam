import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({Key? key}) : super(key: key);

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
