import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/utils.dart';
import 'controller.dart';
import 'layouts/layouts.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
