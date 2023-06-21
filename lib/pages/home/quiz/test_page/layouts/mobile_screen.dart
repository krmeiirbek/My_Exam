import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';

import '../controller.dart';
import '../state.dart';

class MobileScreen extends GetView<TestPageController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onExitOfQuiz,
      child: Obx(() => Scaffold(
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "${controller.state.time.value ~/ 3600}:${(controller.state.time.value ~/ 60 % 60).toString().padLeft(2, '0')}:${(controller.state.time.value % 60).toString().padLeft(2, '0')}",
                              style: labelLarge.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () async {
                                if (await onExitOfQuiz()) {
                                  Get.back();
                                }
                              },
                              child: Text(
                                "Тестті аяқтау",
                                style: labelMedium.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 35.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) => Obx(() => InkWell(
                                onTap: () {
                                  controller.changeSubject(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: controller.state.subjectId.value ==
                                            index
                                        ? Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.1)
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.state.subjects[index].name,
                                      style: controller.state.subjectId.value ==
                                              index
                                          ? TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            )
                                          : TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .unselectedWidgetColor,
                                            ),
                                    ),
                                  ),
                                ),
                              )),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.w),
                          itemCount: controller.state.subjects.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const Divider(thickness: 1.5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Сұрақтар",
                              style: titleSmall.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                controller.state.menuDialog.value = true;
                              },
                              child: Text(
                                "Құралдар",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) => Obx(() => InkWell(
                                onTap: () {
                                  controller.changeQuestion(index);
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  padding: EdgeInsets.all(5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: controller.state.questionId.value ==
                                            index
                                        ? Theme.of(context).colorScheme.primary
                                        : controller
                                                .state
                                                .subjects[controller
                                                    .state.subjectId.value]
                                                .questions[index]
                                                .selectedOptions
                                                .isNotEmpty
                                            ? Theme.of(context)
                                                .colorScheme
                                                .surface
                                            : Colors.transparent,
                                    border: controller.state.questionId.value ==
                                            index
                                        ? null
                                        : controller
                                                .state
                                                .subjects[controller
                                                    .state.subjectId.value]
                                                .questions[index]
                                                .selectedOptions
                                                .isNotEmpty
                                            ? null
                                            : Border.all(
                                                color: Theme.of(context)
                                                    .unselectedWidgetColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: controller
                                                  .state.questionId.value ==
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
                                              : TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                      .unselectedWidgetColor,
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
                      SizedBox(height: 10.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
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
                                  Text(
                                    '${controller.state.subjects[controller.state.subjectId.value].questions[controller.state.questionId.value].text2}',
                                    style: titleSmall.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                SizedBox(height: 10.h),
                                Text(
                                  '${controller.state.questionId.value + 1}. ${controller.state.subjects[controller.state.subjectId.value].questions[controller.state.questionId.value].text}',
                                  style: bodyMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                ...controller
                                    .state
                                    .subjects[controller.state.subjectId.value]
                                    .questions[
                                        controller.state.questionId.value]
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
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.h,
                                            horizontal: 10.w,
                                          ),
                                          margin: EdgeInsets.only(top: 10.h),
                                          decoration: BoxDecoration(
                                            color: controller
                                                    .state
                                                    .subjects[controller
                                                        .state.subjectId.value]
                                                    .questions[controller
                                                        .state.questionId.value]
                                                    .selectedOptions
                                                    .contains(option)
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(8.w),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          child: Text(
                                            '${option.code}. ${option.text}',
                                            style: titleSmall.copyWith(
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
                                padding: EdgeInsets.all(10.w),
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 16.w,
                                    ),
                                    SizedBox(width: 20.w),
                                    Text(
                                      "Алдыңғы",
                                      style: labelMedium.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                padding: EdgeInsets.all(10.w),
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Келесі",
                                      style: labelMedium.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
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
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.w)),
                          ),
                          child: SafeArea(
                            top: false,
                            child: Column(
                              children: [
                                SizedBox(height: 20.h),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.none)
                                  Text(
                                    'Құралдар',
                                    style: titleSmall,
                                  ),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.calculator)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.state.menuDialogPage
                                                  .value = MenuDialogPage.none;
                                            },
                                            child: const Icon(
                                                Icons.arrow_back_ios_outlined)),
                                        Expanded(
                                            child: Center(
                                                child: Text(
                                          'Калькулятор',
                                          style: titleSmall,
                                        ))),
                                      ],
                                    ),
                                  ),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.mendeleev)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.state.menuDialogPage
                                                  .value = MenuDialogPage.none;
                                            },
                                            child: const Icon(
                                                Icons.arrow_back_ios_outlined)),
                                        const Expanded(
                                            child: Center(
                                                child: Text(
                                          'Менделеев кестесі',
                                          style: title3,
                                        ))),
                                      ],
                                    ),
                                  ),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.solubility)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.state.menuDialogPage
                                                  .value = MenuDialogPage.none;
                                            },
                                            child: const Icon(
                                                Icons.arrow_back_ios_outlined)),
                                        Expanded(
                                            child: Center(
                                                child: Text(
                                          'Ерігіштік кестесі',
                                          style: titleSmall,
                                        ))),
                                      ],
                                    ),
                                  ),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.foundAnError)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.state.menuDialogPage
                                                  .value = MenuDialogPage.none;
                                            },
                                            child: const Icon(
                                                Icons.arrow_back_ios_outlined)),
                                        Expanded(
                                            child: Center(
                                                child: Text(
                                          'Қате таптыңыз ба?',
                                          style: titleSmall,
                                        ))),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 10.h),
                                const Divider(
                                  thickness: 2,
                                ),
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.none) ...[
                                  SizedBox(
                                    height: 220.h,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.only(left: 20.w),
                                      children: controller.state.subjects
                                          .map((subjects) => Row(
                                                children: [
                                                  SizedBox(
                                                    width: 170.w,
                                                    height: 220.h,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 40.h,
                                                          child: Center(
                                                              child: Text(
                                                            subjects.name,
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                        ),
                                                        Wrap(
                                                          spacing: 5.w,
                                                          runSpacing: 5.w,
                                                          children:
                                                              subjects.questions
                                                                  .map(
                                                                    (question) =>
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller.goQuestionFromMenu(
                                                                            subjects,
                                                                            question);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            24.h,
                                                                        width:
                                                                            24.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.w),
                                                                          color: question.selectedOptions.isNotEmpty
                                                                              ? Theme.of(context).colorScheme.surface
                                                                              : Colors.transparent,
                                                                          border: question.selectedOptions.isNotEmpty
                                                                              ? null
                                                                              : Border.all(color: Theme.of(context).unselectedWidgetColor),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            '${subjects.questions.indexOf(question) + 1}',
                                                                            style: question.selectedOptions.isNotEmpty
                                                                                ? labelSmall.copyWith(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    color: Colors.white,
                                                                                  )
                                                                                : labelSmall.copyWith(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: Theme.of(context).unselectedWidgetColor,
                                                                                  ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 30.w),
                                                ],
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: InkWell(
                                      onTap: () {
                                        controller.state.menuDialogPage.value =
                                            MenuDialogPage.calculator;
                                      },
                                      child: Container(
                                        height: 50.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calculate_outlined,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: 30.w,
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                                child: Text(
                                              'Калькулятор',
                                              style: labelLarge.copyWith(
                                                  color: Theme.of(context).colorScheme.onSecondary,
                                                  fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Theme.of(context).colorScheme.onSecondary,
                                              size: 17.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: InkWell(
                                      onTap: () {
                                        controller.state.menuDialogPage.value =
                                            MenuDialogPage.mendeleev;
                                      },
                                      child: Container(
                                        height: 50.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.view_column_outlined,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: 30.w,
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                                child: Text(
                                              'Менделеев кестесі',
                                              style: labelLarge.copyWith(
                                                  color: Theme.of(context).colorScheme.onSecondary,
                                                  fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Theme.of(context).colorScheme.onSecondary,
                                              size: 17.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: InkWell(
                                      onTap: () {
                                        controller.state.menuDialogPage.value =
                                            MenuDialogPage.solubility;
                                      },
                                      child: Container(
                                        height: 50.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.waves_sharp,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: 30.w,
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                                child: Text(
                                              'Ерігіштік кестесі',
                                              style: labelLarge.copyWith(
                                                  color: Theme.of(context).colorScheme.onSecondary,
                                                  fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Theme.of(context).colorScheme.onSecondary,
                                              size: 17.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: InkWell(
                                      onTap: () {
                                        controller.state.menuDialogPage.value =
                                            MenuDialogPage.foundAnError;
                                      },
                                      child: Container(
                                        height: 50.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.flag,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: 30.w,
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                                child: Text(
                                              'Қате таптыңыз ба?',
                                              style: labelLarge.copyWith(
                                                  color: Theme.of(context).colorScheme.onSecondary,
                                                  fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Theme.of(context).colorScheme.onSecondary,
                                              size: 17.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.calculator) ...[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.60,
                                    child: SimpleCalculator(
                                      value: controller
                                          .state.calcCurrentValue.value,
                                      hideExpression: false,
                                      hideSurroundingBorder: true,
                                      autofocus: true,
                                      onChanged: (key, value, expression) {
                                        controller.state.calcCurrentValue
                                            .value = value ?? 0;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.mendeleev) ...[
                                  Image.asset(
                                    'assets/images/mendeleev.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.solubility) ...[
                                  Image.asset(
                                    'assets/images/solubility.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                                if (controller.state.menuDialogPage.value ==
                                    MenuDialogPage.foundAnError)
                                  ...[],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )),
    );
  }

  Future<bool> onExitOfQuiz() async {
    int a = Random().nextInt(5);
    int b = Random().nextInt(5);
    int result = 0;
    return await Get.defaultDialog(
      title: "Тестті аяқтау үшін амалды орыңдаңыз?",
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${a + 1} + ${b + 1} = "),
          SizedBox(
            width: 20.w,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                result = int.tryParse(value) ?? 0;
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            await Future.delayed(const Duration(milliseconds: 100));
            Get.back(result: result == a + b + 2);
          },
          child: const Text(
            "Аяқтау",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
