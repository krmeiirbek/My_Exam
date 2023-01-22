import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/screens/home/home_page/components/enum/ubt_enum.dart';
import 'package:my_exam/screens/home/home_page/components/toggle_switch_button.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../controllers/ubt_controller.dart';
import '../components/subjects_gridview.dart';

class StandardScreen extends GetView<UBTController> {
  StandardScreen({Key? key}) : super(key: key);

  final isSelected = UBT.subject.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: appBarGradient(),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                ),
              ),
            ),
            Positioned(
              right: 30,
              top: 55,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 22,
                  ),
                  Positioned(
                    top: -1,
                    right: -8,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Text(
                        '1',
                        style: TextStyle(
                          color: Color(0xffE3F0FF),
                          fontSize: 10,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: 30,
              right: 30,
              bottom: 10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Сәлем,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          children: [
                            TextSpan(
                              text: '\nKazybek',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '\nЖетістікке жету үшін жаттығу жасайық',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/avatar.png',
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Obx(() => Expanded(
                            flex: isSelected.value == UBT.subject ? 3 : 2,
                            child: ToggleSwitchButton(
                              text: 'Пәндер',
                              color: Colors.white,
                              isSelected: isSelected.value == UBT.subject,
                              onTap: () => isSelected(UBT.subject),
                            ),
                          )),
                      const SizedBox(width: 5),
                      Obx(() => Expanded(
                            flex: isSelected.value == UBT.ubt ? 3 : 2,
                            child: ToggleSwitchButton(
                              text: 'ҰБТ',
                              color: Colors.white,
                              isSelected: isSelected.value == UBT.ubt,
                              onTap: () => isSelected(UBT.ubt),
                            ),
                          )),
                      const SizedBox(width: 5),
                      Obx(() => Expanded(
                            flex: isSelected.value == UBT.course ? 3 : 2,
                            child: ToggleSwitchButton(
                              text: 'Курстар',
                              color: Colors.white,
                              isSelected: isSelected.value == UBT.course,
                              onTap: () => isSelected(UBT.course),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Obx(
          () {
            if (isSelected.value == UBT.subject) {
              return Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 30,
                  ),
                  child: subjectsGridview(controller),
                ),
              );
            } else if (isSelected.value == UBT.ubt) {
              return const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 30,
                  ),
                  child: Scaffold(
                    body: Center(
                      child: Text('ҰБТ'),
                    ),
                  ),
                ),
              );
            } else {
              return const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 30,
                  ),
                  child: Scaffold(
                    body: Center(
                      child: Text('Курстар'),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
