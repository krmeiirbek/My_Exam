import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/store/store.dart';
import 'package:my_exam/common/widgets/app_button.dart';

import '../../common/values/values.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Home page'),
            AppButton(
              text: 'Log out',
              style: title3.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
              size: const Size(270, 50),
              background: prColor(),
              boxShadow: [
                BoxShadow(
                  color: secondaryColor().withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
              onTap: () {
                Get.find<UserStore>().onLogout();
              },
            ),
             ],
        ),
      ),
    );
  }
}
