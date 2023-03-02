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

class StandardScreen extends GetView<SignUpController> {
  const StandardScreen({

    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obscure = true.obs;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIParameters.mobileScreenPadding),
        child: Form(
          key: controller.state.formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: size.width,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/splash.svg',
                      width: 110,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    createAccount.tr,
                    style: title1,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    createAnAccountToContinue.tr,
                    style: bodyText1.copyWith(color: secondaryTextColor()),
                  ),
                  const SizedBox(height: 35),
                  TextFormField(
                    controller: controller.nameController,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !duIsEmail(email)
                            ? 'Қате email'
                            : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xffC3C3C3),
                      ),
                    ),
                  ),
                  Obx(() => TextFormField(
                        controller: controller.passwordController,
                        obscureText: obscure.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (password) =>
                            password != null && password.length < 6
                                ? 'Кемінде 6 символ болуы керек'
                                : null,
                        decoration: InputDecoration(
                          labelText: 'Құпия сөз',
                          labelStyle: const TextStyle(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (verifyPassword) =>
                            verifyPassword != null &&
                                    verifyPassword != controller.passwordController.text
                                ? 'Қате сәйкестендіру'
                                : null,
                        decoration: const InputDecoration(
                          labelText: 'Құпия сөзді қайталау',
                          labelStyle: TextStyle(
                            color: Color(0xffC3C3C3),
                          ),
                        ),
                      )),
                  const SizedBox(height: 40),
                ],
              ),
              Obx(() {
                if (controller.state.isLoading.value) {
                  return SpinKitCircle(
                    color: secondaryColor(),
                    size: 50,
                  );
                } else {
                  return AppButton(
                    text: signUp.tr,
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
                      controller.signUp();
                    },
                  );
                }
              }),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    alreadyHaveAnAccount.tr,
                    style: bodyText1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRoutes.signIn);
                    },
                    child: Text(
                      signIn.tr,
                      style: subtitle2.copyWith(color: secondaryColor()),
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