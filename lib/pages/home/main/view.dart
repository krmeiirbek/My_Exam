import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/values/app_colors.dart';
import 'package:my_exam/common/values/custom_text_styles.dart';

import 'controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(controller.state.isLoading.value){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Image.asset('assets/images/fake_user.png'),
                ),
                title: Text(
                  "Salem, ${controller.state.name}!✌",
                  style: title3.copyWith(
                    color: prTextColor(),
                  ),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      CupertinoIcons.line_horizontal_3_decrease,
                      color: prTextColor(),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-1, -1),
                            end: Alignment(0.9, 2),
                            colors: [
                              Color.fromARGB(255, 32, 45, 171),
                              Color.fromARGB(255, 152, 85, 204),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: SvgPicture.asset(
                                      'assets/icons/discount.svg',
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '72% OFF',
                                      style: bodyText2.copyWith(fontSize: 14),
                                    ),
                                    Text(
                                      '3D graphics for beginners',
                                      style: title3.copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      'Basic knowledge required to create\nmodels for mobile and computer games',
                                      style:
                                      bodyText1.copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '19.99 \$ ',
                                          style:
                                          title2.copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          '59.99 \$',
                                          style: bodyText2.copyWith(
                                              decoration:
                                              TextDecoration.lineThrough),
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
                      const SizedBox(height: 20),
                      const Text(
                        "ҰБТ сынақ тест",
                        style: title3,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.dialog(
                                Center(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      height: 400,
                                      width: 300,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Obx(() => Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            "Таңдау пәндерің қандай?",
                                            style: title3,
                                          ),
                                          DropdownButton(
                                            value: controller.state.item.value,
                                            hint: const Text("Бірінші пән"),
                                            items:
                                            controller.state.items.keys.map(
                                                  (subject) {
                                                return DropdownMenuItem(
                                                  value: subject,
                                                  child: Text(subject),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (newItem) {
                                              controller.state.item.value =
                                                  newItem;
                                              controller.state.item2.value =
                                              null;
                                            },
                                            isExpanded: true,
                                          ),
                                          DropdownButton(
                                            value: controller.state.item2.value,
                                            hint: const Text("Екінші пән"),
                                            items: controller
                                                .state
                                                .items[
                                            controller.state.item.value]
                                                ?.map(
                                                  (e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ),
                                            )
                                                .toList(),
                                            onChanged: (newItem) {
                                              controller.state.item2.value =
                                                  newItem;
                                            },
                                            isExpanded: true,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: prColor(),
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: secondaryColor()
                                                        .withOpacity(0.4),
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 2,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Тесті бастау',
                                                  style: subtitle2.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                name: "ubtFormat",
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 32, 45, 171),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "ҰБТ форматта",
                                style: subtitle2.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 152, 85, 204),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Пәндік",
                                style: subtitle2.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Курстар",
                        style: title3,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return _subjectItem(
                      name: '${controller.state.courses[index].name}',
                      author: '${controller.state.courses[index].owner}',
                      price: '${(index + 15.99).toPrecision(2)}',
                      picture: '',
                    );
                  },
                  childCount: controller.state.courses.length,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

Widget _subjectItem({
  required String name,
  required String author,
  required String price,
  required String picture,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
    child: Container(
      padding: const EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        color: secondaryBackground(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/bio.jpeg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: subtitle1,
                  ),
                  Text(
                    "by $author",
                    style: bodyText1.copyWith(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "$price \$",
                    style: subtitle1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
