import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/values/values.dart';
import '../controller.dart';

class MobileScreen extends GetView<RulesPageController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Тестілеу ережелері",
          style: titleMedium.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                border: Border.all(
                  color: Theme.of(context).unselectedWidgetColor,
                  width: 3,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Тестілеуге ${controller.time} сағат беріледі",
                    style: labelLarge.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_open_outlined,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "Қолдаңбаның премиум пайдаланушысы болсаңыз, сынақты шексіз тапсыра аласыз.",
                          style: bodyMedium.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_added_outlined,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "Барлық сұрақтарға жауап бергеннен кейін тестті аяқтаңыз.",
                          style: bodyMedium.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.newspaper_outlined,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "Пәндер: мат. сауаттылық, математика, физика және химия есептердің толық жауаптары мен шешімдерін қамтиды.",
                          style: bodyMedium.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onError.withOpacity(0.2)),
              child: Text(
                "Шешімдерді жоғалтып алмау үшін тестілеу кезінде қосымшадан шықпаңыз",
                style: bodyMedium.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                    fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Divider(color: Theme.of(context).unselectedWidgetColor, thickness: 3),
            SizedBox(height: 15.h),
            InkWell(
              onTap: () {
                controller.goTestPage();
              },
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.w),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Бастау',
                    style: labelLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
