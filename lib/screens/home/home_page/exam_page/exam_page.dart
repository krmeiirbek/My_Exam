import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/models/subject.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamPage extends StatelessWidget {
  ExamPage({Key? key}) : super(key: key);

  final isMainTest = true.obs;

  @override
  Widget build(BuildContext context) {
    var subject = Get.arguments as Subject;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 270,
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
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => OutlinedButton(
                                onPressed: () {
                                  isMainTest(true);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: isMainTest.value
                                      ? const Color(0xff3D3D74).withOpacity(0.3)
                                      : Colors.transparent,
                                  side: const BorderSide(
                                      color: Color(0xff3D3D74)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text(
                                  'Жаңа нұсқалар',
                                  style: TextStyle(
                                    color: Color(0xff3D3D74),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Obx(() => OutlinedButton(
                                onPressed: () {
                                  isMainTest(false);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: !isMainTest.value
                                      ? const Color(0xff3D3D74).withOpacity(0.3)
                                      : Colors.transparent,
                                  side: const BorderSide(
                                      color: Color(0xff3D3D74)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text(
                                  'Тақырыптық',
                                  style: TextStyle(
                                    color: Color(0xff3D3D74),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(
            () => Expanded(
              child: isMainTest.value
                  ? ListView.builder(
                      itemBuilder: (_, idx) => Column(
                        children: [
                          Container(
                            height: 110,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 2),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/Img1.svg'),
                                      const SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Exam number ${subject.variants?[idx].variantId}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Questions ${subject.variants?[idx].questions?.length}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Color(0xff999999),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                          'assets/icons/check1.svg')
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        lineHeight: 8.0,
                                        percent: 0.7,
                                        barRadius: const Radius.circular(5),
                                        linearGradient: const LinearGradient(
                                          colors: [
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                            Color(0xffF7AC1A),
                                            Colors.yellow,
                                            Color(0xffF7AC1A),
                                          ],
                                          stops: [
                                            0.1,
                                            0.15,
                                            0.2,
                                            0.25,
                                            0.3,
                                            0.35,
                                            0.4,
                                            0.45,
                                            0.5,
                                            0.55,
                                            0.6,
                                            0.65,
                                            0.7,
                                            0.75,
                                            0.8,
                                            0.85,
                                            0.9,
                                            0.95,
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      ' 70%',
                                      style: TextStyle(
                                          color: Color(0xff4CAF50),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                      itemCount: subject.variants?.length,
                      padding: const EdgeInsets.only(
                          top: 20, right: 30, left: 30, bottom: 30),
                    )
                  : const Scaffold(
                      body: Center(
                        child: Text('Тақырыптық'),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
