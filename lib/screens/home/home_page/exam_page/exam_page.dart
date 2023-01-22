import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/models/question.dart';
import 'package:my_exam/widgets/app_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExamPage extends StatelessWidget {
  ExamPage({Key? key, required this.questions}) : super(key: key);
  final List<Question>? questions;
  final index = 0.obs;
  final answered = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                color: const Color(0xff3D3D74),
              ),
            ),
            Expanded(
              child: Obx(() => LinearPercentIndicator(
                    lineHeight: 10,
                    barRadius: const Radius.circular(10),
                    progressColor: const Color(0xffF7AC1A),
                    backgroundColor: const Color(0xffEEEEEE),
                    percent: answered.value /
                        (questions?.length ?? (answered.value + 1)),
                  )),
            ),
          ],
        ),
        backgroundColor: const Color(0xffF6F7FC),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${index.value + 1}',
                style:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                '${questions?[index.value].question}',
                style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              Flexible(
                child: ListView.builder(
                  itemCount: questions?[index.value].answers?.length,
                  itemBuilder: (_, idx) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/circle.svg'),
                            const SizedBox(width: 10),
                            Text(
                              '${questions?[index.value].answers?[idx].answer}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    );
                  },
                ),
              ),
              AppButton(
                text: 'Continue',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                background: const Color(0xff4785EB),
                width: double.infinity,
                onTap: () {
                  if(index.value + 1< (questions?.length ?? 0)) {
                    index(index.value + 1);
                    answered(answered.value + 1);
                  }
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
