import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/langs/langs.dart';

import '../../../../common/values/values.dart';
import '../controller.dart';

class MobileScreen extends GetView<ProfileController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.w, 0.0),
                child: InkWell(
                  onTap: (){
                    controller.signOut();
                  },
                  child: Icon(
                    Icons.notifications_none,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 24.w,
                  ),
                ),
              )
            ],
            centerTitle: true,
            title: Text(
              settings1.tr,
              style: titleLarge.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Obx(() {
                  if(controller.state.isLoading.value){
                    return SpinKitCircle(
                      color: Theme.of(context).colorScheme.primary,
                      size: 50.h,
                    );
                  }else{
                    return Container(
                      margin: EdgeInsets.only(bottom: 15.h,top: 15.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: Theme.of(context).colorScheme.background,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(25.w, 0.0, 10.w, 0.0),
                                child: Container(
                                  width: 60.w,
                                  height: 60.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/83/600',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${controller.state.me.value.first_name} ${controller.state.me.value.last_name}',
                                    style: bodyMedium.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${controller.state.me.value.email}',
                                    style: bodySmall.copyWith(
                                      color: Theme.of(context).unselectedWidgetColor,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.h),
                                    child: Text(
                                      '+77475551101',
                                      style: bodySmall
                                          .copyWith(
                                        color:
                                        Theme.of(context).unselectedWidgetColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Профилді өзгерту',
                                    style: bodyMedium.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.w, 0.0),
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).unselectedWidgetColor,
                              size: 28.w,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.phone_iphone_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Біздің әлеуметтік желілер",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.newspaper_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Жаңалықтар",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.paste_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Нұсқаулық",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.help_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Қолдау қызметі",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Құпия сөзді өзгерту",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.language_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Интерфейс тілі",
                        style: titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
