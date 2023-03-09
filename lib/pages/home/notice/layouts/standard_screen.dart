import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/widgets/glass_morphism.dart';
import 'package:my_exam/pages/home/notice/controller.dart';

import '../../../../common/values/values.dart';

class StandardScreen extends GetView<NoticeController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ubt = true.obs;
    return Scaffold(
      body: Obx(() => CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "ҰБТ БАЙҚАУ СЫНАҒЫ",
              style: title2.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GlassMorphism(
                blur: 20,
                opacity: 0.2,
                radius: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              ubt(false);
                            },
                            child: Center(
                              child: Text(
                                "ПӘН БОЙЫНША",
                                style: subtitle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ubt.value ? null :Colors.deepPurpleAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              ubt(true);
                            },
                            child: Center(
                              child: Text(
                                "ТОЛЫҚ ҰБТ",
                                style: subtitle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ubt.value ? Colors.deepPurpleAccent : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
