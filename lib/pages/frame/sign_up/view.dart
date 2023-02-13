import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/utils.dart';
import 'controller.dart';
import 'layouts/layouts.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          smallMobile: NarrowScreen(),
          mobile: StandardScreen(),
          tablet: TabletScreen(),
        ),
      ),
    );
  }
}
