import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../controllers/ubt_controller.dart';
import '../components/subjects_gridview.dart';

class NarrowScreen extends GetView<UBTController> {
  const NarrowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                gradient: appBarGradient(),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 40,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 18,
                  ),
                  Positioned(
                    top: -1,
                    right: -7,
                    child: Container(
                      height: 12,
                      width: 12,
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
              top: 70,
              left: 20,
              child: RichText(
                text: const TextSpan(
                  text: 'Сәлем,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: '\nKazybek',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: '\nЖетістікке жету үшін жаттығу жасайық',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              right: 20,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 55,
                ),
              ),
            ),
          ],
        ),
        Flexible(child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 20,
          ),
          child: subjectsGridview(controller),
        )),
      ],
    );
  }
}
