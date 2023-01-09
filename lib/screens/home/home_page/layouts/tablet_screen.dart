import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/app_colors.dart';
import '../../../../controllers/ubt_controller.dart';
import '../components/subjects_gridview.dart';

class TabletScreen extends GetView<UBTController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              width: double.infinity,
              height: 125,
              decoration: BoxDecoration(
                gradient: appBarGradient(),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
            Positioned(
              right: 120,
              top: 60,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 30,
                  ),
                  Positioned(
                    top: -1,
                    right: -8,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Color(0xffE3F0FF),
                              fontSize: 14,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 30,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 65,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0xff599BF0),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/splash.svg',
                  color: Colors.white,
                  height: 65,
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
          child: subjectsGridview(controller,isTablet: true),
        )),
      ],
    );
  }
}
