import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';
import 'package:tex_text/tex_text.dart';

import '../controller.dart';

class StandardScreen extends GetView<TestPageController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              SafeArea(
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
                                color: Colors.black87,
                                fontWeight: FontWeight.w900),
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
                                  color:
                                      controller.state.subjectId.value == index
                                          ? Colors.blue.withOpacity(0.1)
                                          : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    controller.state.subjects[index].name,
                                    style: controller.state.subjectId.value ==
                                            index
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
                    const Divider(thickness: 1.5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Row(
                        children: [
                          const Text(
                            "Сұрақтар",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              controller.state.menuDialog.value = true;
                            },
                            child: const Text(
                              "Құралдар",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
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
                                  color:
                                      controller.state.questionId.value == index
                                          ? Colors.blue
                                          : controller
                                                  .state
                                                  .subjects[controller
                                                      .state.subjectId.value]
                                                  .questions[index]
                                                  .selectedOptions
                                                  .isNotEmpty
                                              ? Colors.green
                                              : Colors.transparent,
                                  border:
                                      controller.state.questionId.value == index
                                          ? null
                                          : controller
                                                  .state
                                                  .subjects[controller
                                                      .state.subjectId.value]
                                                  .questions[index]
                                                  .selectedOptions
                                                  .isNotEmpty
                                              ? null
                                              : Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: controller.state.questionId.value ==
                                            index
                                        ? const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          )
                                        : controller
                                                .state
                                                .subjects[controller
                                                    .state.subjectId.value]
                                                .questions[index]
                                                .selectedOptions
                                                .isNotEmpty
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
                            .questions
                            .length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller
                                      .state
                                      .subjects[
                                          controller.state.subjectId.value]
                                      .questions[
                                          controller.state.questionId.value]
                                      .text2 !=
                                  null)
                                TexText(
                                  '${controller.state.subjects[controller.state.subjectId.value].questions[controller.state.questionId.value].text2}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              const SizedBox(height: 10),
                              TexText(
                                '${controller.state.questionId.value + 1}. ${controller.state.subjects[controller.state.subjectId.value].questions[controller.state.questionId.value].text}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              ...controller
                                  .state
                                  .subjects[controller.state.subjectId.value]
                                  .questions[controller.state.questionId.value]
                                  .options
                                  .map(
                                (option) => Obx(() => InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        controller.selectOption(option);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 10,
                                        ),
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          color: controller
                                                  .state
                                                  .subjects[controller
                                                      .state.subjectId.value]
                                                  .questions[controller
                                                      .state.questionId.value]
                                                  .selectedOptions
                                                  .contains(option)
                                              ? Colors.blue
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.blue),
                                        ),
                                        child: TexText(
                                          '${option.code}. ${option.text}',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: controller.prevQuestion,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Келесі",
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
              if (controller.state.menuDialog.value)
                Container(
                  color: Colors.grey.withOpacity(0.4),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.state.menuDialog.value = false;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: SafeArea(
                          top: false,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text('Menu',style: title3,),
                              const SizedBox(height: 10),
                              const Divider(thickness: 2,),
                              SizedBox(
                                height: 210,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(left: 20),
                                  children: controller.state.subjects.map((subjects) => Row(
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 209,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                                child: Center(child: Text(subjects.name,textAlign: TextAlign.center,)),
                                            ),
                                            Wrap(
                                              spacing: 5,
                                              runSpacing: 5,
                                              children: subjects.questions.map((question) => InkWell(
                                                onTap: (){
                                                  controller.goQuestionFromMenu(subjects,question);
                                                },
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color:
                                                        question
                                                        .selectedOptions
                                                        .isNotEmpty
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    border:question
                                                        .selectedOptions
                                                        .isNotEmpty
                                                        ? null
                                                        : Border.all(color: Colors.grey),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${subjects.questions.indexOf(question) + 1}',
                                                      style: question
                                                          .selectedOptions
                                                          .isNotEmpty
                                                          ? const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                      )
                                                          : const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 30),
                                    ],
                                  )).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 243, 243, 245),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.calculate_outlined,color: Colors.blue,size: 30,),
                                      SizedBox(width: 20),
                                      Expanded(child: Text('Калькулятор',style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                      ),)),
                                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 17,),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 243, 243, 245),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.view_column_outlined,color: Colors.blue,size: 30,),
                                      SizedBox(width: 20),
                                      Expanded(child: Text('Менделеев кестесі',style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                      ),)),
                                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 17,),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 243, 243, 245),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.waves_sharp,color: Colors.blue,size: 30,),
                                      SizedBox(width: 20),
                                      Expanded(child: Text('Ерігіштік кестесі',style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16
                                      ),)),
                                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 17,),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 243, 243, 245),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.flag,color: Colors.blue,size: 30,),
                                      SizedBox(width: 20),
                                      Expanded(child: Text('Қате таптыңыз ба?',style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16
                                      ),)),
                                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 17,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}
