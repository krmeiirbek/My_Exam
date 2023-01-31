import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../responsive.dart';
import 'layouts/standard_screen.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/tablet_screen.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);
  static const String routeName = '/email_verify';

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool? isEmailVerified;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // user must be created
    isEmailVerified = Get.find<AuthController>().user?.emailVerified;

    if(isEmailVerified != null){
      if(!isEmailVerified!){
        Get.find<AuthController>().sendVerificationEmail();
        timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
      }
    }else {
      Get.back();
    }
  }

  Future checkEmailVerified() async {
    await Get.find<AuthController>().user?.reload();

    setState(() {
      isEmailVerified = Get.find<AuthController>().user?.emailVerified;
    });

    if(isEmailVerified != null){
      if(isEmailVerified!) {
        timer?.cancel();
        Get.find<AuthController>().authStatus.value = AuthStatus.authorizedVerify;
        Get.find<AuthController>().navigateToHomeScreen();
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
