import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/routes/routes.dart';
import '../../../../common/style/style.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import '../../components/components.dart';
import '../controller.dart';

class TabletScreen extends GetView<SignUpController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return Padding(
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
                        Text(
                          createAccount.tr,
                          style: title1.copyWith(fontSize: 40),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          createAnAccountToContinue.tr,
                          style:
                              subtitle2.copyWith(color: secondaryTextColor()),
                        ),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: controller.nameController,
                          style: title2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (name) =>
                          name == ""
                              ? 'Қате name'
                              : null,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: controller.surnameController,
                          style: title2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (surname) =>
                          surname == ""
                              ? 'Қате surname'
                              : null,
                          decoration: const InputDecoration(
                            labelText: 'Surname',
                            labelStyle: TextStyle(
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: title2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        Obx(() => TextFormField(
                              controller: controller.passwordController,
                              obscureText: obscure.value,
                              style: title2,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (password) =>
                                  password != null && password.length < 6
                                      ? 'Кемінде 6 символ болуы керек'
                                      : null,
                              decoration: InputDecoration(
                                labelText: 'Құпия сөз',
                                labelStyle: const TextStyle(
                                  fontSize: 21,
                                  color: Color(0xffC3C3C3),
                                ),
                                suffixIcon: eyeSuffixIcon(
                                  onTap: () {
                                    obscure(!obscure.value);
                                  },
                                  color: obscure.value
                                      ? secondaryTextColor()
                                      : tertiaryColor(),
                                ),
                              ),
                            )),
                        Obx(() => TextFormField(
                              controller: controller.verifyPasswordController,
                              obscureText: obscure.value,
                              style: title2,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (verifyPassword) =>
                                  verifyPassword != null &&
                                          verifyPassword !=
                                              controller.passwordController.text
                                      ? 'Қате сәйкестендіру'
                                      : null,
                              decoration: const InputDecoration(
                                labelText: 'Құпия сөзді қайталау',
                                labelStyle: TextStyle(
                                  fontSize: 21,
                                  color: Color(0xffC3C3C3),
                                ),
                              ),
                            )),
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
                                text: signUp.tr,
                                size: const Size(400, 60),
                                style: title2.copyWith(
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
                                  controller.signUp();
                                },
                              );
                            }
                          }),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: subtitle1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRoutes.signIn);
                    },
                    child: Text(
                      signIn.tr,
                      style: title3.copyWith(color: secondaryColor()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
