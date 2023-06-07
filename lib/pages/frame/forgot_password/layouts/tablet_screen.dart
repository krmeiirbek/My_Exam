import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../controller.dart';

class TabletScreen extends GetView<ForgotPasswordController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Құпия сөзді ұмыттыңыз ба?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(UIParameters.mobileScreenPadding * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/splash.svg',
                          width: size.width / 4,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Form(
                      key: controller.state.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Құпия сөзді қалпына келтіру үшін электрондық хат алыңыз',
                            style: title2,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 35),
                          TextFormField(
                            controller: controller.emailController,
                            style: title2,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !duIsEmail(email)
                                    ? 'Қате email'
                                    : null,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontSize: 21,
                                color: Color(0xffC3C3C3),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: Obx(() {
                              if (controller.state.isLoading.value) {
                                return SpinKitCircle(
                                  color: secondaryColor(),
                                  size: 60,
                                );
                              } else {
                                return AppButton(
                                  text: 'Құпия сөзді қалпына келтіру',
                                  size: const Size(400, 60),
                                  style: title3.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  background: prColor(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: secondaryColor().withOpacity(0.4),
                                      offset: const Offset(0, 5),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  onTap: () {
                                    controller.forgotPassword();
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
