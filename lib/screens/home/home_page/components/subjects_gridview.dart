import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/controllers/ubt_controller.dart';

Widget subjectsGridview(UBTController controller, {bool isTablet = false}) {
  final scrollController = ScrollController();
  return Obx(() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scrollbar(
        controller: scrollController,
        radius: const Radius.circular(10),
        thickness: 5,
        child: GridView.builder(
          controller: scrollController,
          itemBuilder: (_, idx) => InkWell(
            onTap: (){
              Get.toNamed('/home_page/exam_page',
                arguments: controller.subjects[idx],
              );
            },
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10))),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/icons/subject_background.svg',
                      fit: BoxFit.cover,
                      clipBehavior: Clip.hardEdge,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        '${controller.subjects[idx].subjectName}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 30,
            right: 10,
          ),
          itemCount: controller.subjects.length,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: isTablet ? 350 : 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
        ),
      );
    }
  });
}
