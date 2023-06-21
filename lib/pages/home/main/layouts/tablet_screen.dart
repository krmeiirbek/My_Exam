import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
import '../../../../common/langs/langs.dart';
import '../../../../common/values/values.dart';
import '../index.dart';

class TabletScreen extends GetView<MainController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 45.h),
            child: Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.state.isMainPage.value =
                              MainSubjectPage.subjectPage;
                        },
                        child: Container(
                          decoration: controller.state.isMainPage.value ==
                                  MainSubjectPage.subjectPage
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              lessons.tr,
                              style: titleLarge.copyWith(
                                color: controller.state.isMainPage.value ==
                                        MainSubjectPage.subjectPage
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
                          controller.state.isMainPage.value =
                              MainSubjectPage.comboPage;
                        },
                        child: Container(
                          decoration: controller.state.isMainPage.value ==
                                  MainSubjectPage.comboPage
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "🎁 ",
                                  textAlign: TextAlign.center,
                                  style: titleLarge,
                                ),
                                Text(
                                  combo.tr,
                                  textAlign: TextAlign.center,
                                  style: titleLarge.copyWith(
                                    color: controller.state.isMainPage.value ==
                                            MainSubjectPage.comboPage
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ],
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
      body: Obx(() {
        if (controller.state.isMainPage.value == MainSubjectPage.subjectPage) {
          return _buildSubjectPage(
            context: context,
            controller: controller,
          );
        } else {
          return _buildComboPage(
            context: context,
            controller: controller,
          );
        }
      }),
    );
  }

  Widget _buildSubjectPage({
    required BuildContext context,
    required MainController controller,
  }) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 30.h),
        ),
        ...controller.state.subjects.reversed.map(
          (subject) => _buildSubjectItem(context: context, subject: subject),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 40.h)),
      ],
    );
  }

  Widget _buildComboPage({
    required BuildContext context,
    required MainController controller,
  }) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        ),
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.all(15.w),
            child: Container(
              height: 400.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(10.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.w)),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/solubility.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            "Информатика және математика",
                            style: titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "- Математика",
                                style: labelLarge.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "- Информатика",
                                style: labelLarge.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "- Математикалық сауаттылық",
                                style: labelLarge.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "- Оқу сауаттылық",
                                style: labelLarge.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "- Қазақстан тарихы",
                                style: labelLarge.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }

  Widget _buildSubjectItem({
    required BuildContext context,
    required Subject subject,
  }) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          controller.goSubjectPage(subject: subject);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: 60.h,
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(subject.image_url),
                  ),
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: Text(
                  subject.name,
                  textAlign: TextAlign.start,
                  style: titleMedium.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w400,
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
