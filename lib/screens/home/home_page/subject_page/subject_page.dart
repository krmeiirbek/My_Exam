import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../models/subject.dart';

class SubjectPage extends StatelessWidget {
  SubjectPage({Key? key}) : super(key: key);

  final Subject subject = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xffFFEABA),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                left: 30,
                top: 60,
                bottom: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                            color: const Color(0xff3D3D74),
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/notification.svg',
                              color: const Color(0xff333333),
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
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: '${subject.subjectName}',
                              style: const TextStyle(
                                color: Color(0xff3D3D74),
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                              children: const [
                                TextSpan(
                                  text:
                                      '\nHas been the industry’s standard dummy text ever',
                                  style: TextStyle(
                                    color: Color(0xff3D3D74),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/img_exam.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
            child: Scaffold(
              body: Center(
                child: Text('Тақырыптық'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
