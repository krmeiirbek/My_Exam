import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class StandardScreen extends GetView<TestPageController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${controller.state.time.value}:00:00",
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w900),
                      ),
                      const Spacer(),
                      const Text(
                        "Тестті аяқтау",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) => Obx(() => InkWell(
                          onTap: () {
                            controller.changeSubject(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: controller.state.subjectId.value == index
                                  ? Colors.blue.withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                controller.state.subjects[index].name,
                                style: controller.state.subjectId.value == index
                                    ? const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue,
                                      )
                                    : const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                          ),
                        )),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: controller.state.subjects.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Сұрақтар",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Меню",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) => Obx(() => InkWell(
                          onTap: () {
                            controller.changeQuestion(index);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: controller.state.questionId.value == index
                                  ? Colors.blue
                                  : Colors.transparent,
                              border: controller.state.questionId.value == index
                                  ? null
                                  : Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style:
                                    controller.state.questionId.value == index
                                        ? const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          )
                                        : const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                              ),
                            ),
                          ),
                        )),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: controller
                        .state
                        .subjects[controller.state.subjectId.value]
                        .questions!
                        .length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: controller.prevQuestion,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.blue,
                                size: 16,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Алдыңғы",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: controller.nextQuestion,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Келесі",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

/* Column(
            children: [
              TeXView(
                child: TeXViewColumn(
                  children: [
                    TeXViewDocument(
                      controller
                          .state.questions[controller.questionId.value].text,
                      style: const TeXViewStyle(
                          textAlign: TeXViewTextAlign.center),
                    ),
                    controller.state.questions[controller.questionId.value]
                            .oneAnswer
                        ? TeXViewGroup(
                            children: controller.state
                                .questions[controller.questionId.value].options
                                .map(
                                  (Option option) => TeXViewGroupItem(
                                    rippleEffect: false,
                                    id: option.code,
                                    child: TeXViewDocument(
                                      '${option.code}) ${option.text}',
                                      style: const TeXViewStyle(
                                        padding: TeXViewPadding.all(10),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            selectedItemStyle: TeXViewStyle(
                                borderRadius: const TeXViewBorderRadius.all(10),
                                border: TeXViewBorder.all(
                                    TeXViewBorderDecoration(
                                        borderWidth: 3,
                                        borderColor: Colors.green[900])),
                                margin: const TeXViewMargin.all(10)),
                            normalItemStyle: const TeXViewStyle(
                                margin: TeXViewMargin.all(10)),
                            onTap: (String id) {},
                          )
                        : TeXViewGroup.multipleSelection(
                            children: controller.state
                                .questions[controller.questionId.value].options
                                .map(
                                  (Option option) => TeXViewGroupItem(
                                    rippleEffect: false,
                                    id: option.code,
                                    child: TeXViewDocument(
                                      '${option.code}) ${option.text}',
                                      style: const TeXViewStyle(
                                        padding: TeXViewPadding.all(10),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            selectedItemStyle: TeXViewStyle(
                                borderRadius: const TeXViewBorderRadius.all(10),
                                border: TeXViewBorder.all(
                                    TeXViewBorderDecoration(
                                        borderWidth: 3,
                                        borderColor: Colors.green[900])),
                                margin: const TeXViewMargin.all(10)),
                            normalItemStyle: const TeXViewStyle(
                                margin: TeXViewMargin.all(10)),
                            onItemsSelection: (List<String> ids) {},
                          ),
                  ],
                ),
              ),
            ],
          )*/
