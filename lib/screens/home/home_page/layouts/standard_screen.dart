import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../controllers/ubt_controller.dart';
import '../components/subjects_gridview.dart';

class StandardScreen extends GetView<UBTController> {
  const StandardScreen({Key? key}) : super(key: key);

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
                  bottomLeft: Radius.circular(55),
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
              child: RichText(
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
                          text: '\nЖетістікке жету үшін жаттығу жасайық',
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
            ),
            Positioned(
              top: 100,
              right: 30,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
        Flexible(child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 20,
            left: 30,
          ),
          child: subjectsGridview(controller),
        )),
      ],
    );
  }
}
