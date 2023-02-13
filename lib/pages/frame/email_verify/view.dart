import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/utils.dart';
import 'controller.dart';
import 'layouts/layouts.dart';

class EmailVerifyPage extends GetView<EmailVerifyController> {
  const EmailVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Электронды поштаны растау'),
        automaticallyImplyLeading: false,
      ),
      body: const SafeArea(
        child: Responsive(
          smallMobile: NarrowScreen(),
          mobile: StandardScreen(),
          tablet: TabletScreen(),
        ),
      ),
    );
  }
}
