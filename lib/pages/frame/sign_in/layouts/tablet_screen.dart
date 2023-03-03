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

class TabletScreen extends GetView<SignInController> {
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
                          welcomeBack.tr,
                          style: title1.copyWith(fontSize: 40),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          signInToContinue.tr,
                          style:
                              subtitle2.copyWith(color: secondaryTextColor()),
                        ),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: controller.emailController,
                          style: title2,
                          keyboardType: TextInputType.emailAddress,
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
                                text: signIn.tr,
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
                                  controller.signIn();
                                },
                              );
                            }
                          }),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0, top: 6),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.forgotPassword);
                                },
                                child: Text(
                                  forgotPassword.tr,
                                  style: subtitle1.copyWith(
                                      color: secondaryTextColor()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dontHaveAnAccount.tr,
                    style: subtitle1.copyWith(color: secondaryTextColor()),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      createNow.tr,
                      style: subtitle1.copyWith(color: secondaryColor()),
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
