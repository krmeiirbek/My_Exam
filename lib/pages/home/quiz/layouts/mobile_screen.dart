import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../../../../common/values/values.dart';
import '../state.dart';

class MobileScreen extends GetView<QuizController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changePage(EnumTestPage.private);
                        },
                        child: Container(
                          decoration: controller.state.testPage.value ==
                                  EnumTestPage.private
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Theme.of(context).colorScheme.primary),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Пән бойынша",
                              style: titleSmall.copyWith(
                                color: controller.state.testPage.value ==
                                        EnumTestPage.private
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changePage(EnumTestPage.complete);
                        },
                        child: Container(
                          decoration: controller.state.testPage.value ==
                                  EnumTestPage.complete
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Theme.of(context).colorScheme.primary),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Толық ҰБТ",
                              style: titleSmall.copyWith(
                                color: controller.state.testPage.value ==
                                        EnumTestPage.complete
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: Obx(() => Column(
            children: [
              controller.state.testPage.value == EnumTestPage.private
                  ? _buildSubjectTest()
                  : _buildCompleteTest(context: context),
              SizedBox(height: 20.h),
            ],
          )),
    );
  }

  Widget _buildSubjectTest() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    image: DecorationImage(
                      image: AssetImage(controller.state.subjects[index].image_url),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    child: Text(
                      controller.state.subjects[index].name,
                      style: labelLarge.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.state.subjects.length,
        ),
      ),
    );
  }

  Widget _buildCompleteTest({required BuildContext context}) {
    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Text(
                "Негізгі таңдалған пәндер",
                style: titleSmall.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Қазақстан тарихы.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                        child: Text(
                      'Қазақстан тарихы',
                      style: labelLarge.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Оқу сауаттылық.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Оқу сауаттылық',
                        style: labelLarge.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Математикалық сауаттылық.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Математикалық сауаттылық',
                        style: labelLarge.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Divider(color: Theme.of(context).unselectedWidgetColor, thickness: 3),
              SizedBox(height: 15.h),
              Obx(() => Column(
                    children: [
                      Text(
                        "Таңдау пәндерің қандай?",
                        style: titleSmall.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(8.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0.5, 1.5),
                              blurRadius: 2,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          value: controller.state.subject1.value,
                          hint: const Text("Бірінші пән"),
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(10.w),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Өзгерту',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                size: 13.w,
                              ),
                            ],
                          ),
                          items: controller.state.subjectsComplete.keys.map(
                            (subject) {
                              return DropdownMenuItem(
                                value: subject,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.w),
                                        image: DecorationImage(
                                          image: AssetImage(subject.image_url),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      subject.name,
                                      style: labelLarge.copyWith(
                                        color: Theme.of(context).colorScheme.onSecondary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (newItem) {
                            controller.state.subject1.value = newItem;
                            controller.state.subject2.value = null;
                          },
                          isExpanded: true,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(8.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0.5, 1.5),
                              blurRadius: 2,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          value: controller.state.subject2.value,
                          hint: const Text("Екінші пән"),
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(10.w),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Өзгерту',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                size: 13.w,
                              ),
                            ],
                          ),
                          items: controller.state
                              .subjectsComplete[controller.state.subject1.value]
                              ?.map(
                                (subject) => DropdownMenuItem(
                                  value: subject,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.w),
                                          image: DecorationImage(
                                            image: AssetImage(subject.image_url),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        subject.name,
                                        style: labelLarge.copyWith(
                                          color: Theme.of(context).colorScheme.onSecondary,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newItem) {
                            controller.state.subject2.value = newItem;
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  )),
              const Spacer(),
              Divider(color: Theme.of(context).unselectedWidgetColor, thickness: 3),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  controller.goRulesPage();
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: primaryColor(),
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      BoxShadow(
                        color: secondaryColor().withOpacity(0.4),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Келесі',
                      style: labelLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
