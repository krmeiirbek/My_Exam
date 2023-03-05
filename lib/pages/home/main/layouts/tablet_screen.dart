import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/values/values.dart';
import '../controller.dart';

class TabletScreen extends GetView<MainController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
      onRefresh: () async {
        await controller.getCourses();
      },
      child: CustomScrollView(
        slivers: [
          _buildAppBar(username: '${controller.state.userName}'),
          if (!controller.state.isLoading.value)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBanner(),
                    const SizedBox(height: 30),
                    const Text("Курстар", style: title2),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          else
            _buildLoadingBanner(),
          if (!controller.state.isLoading.value)
            _buildCourses(controller: controller)
          else
            _buildLoadingCourses(),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    ));
  }
}

Widget _buildAppBar({required String username}) {
  return SliverAppBar(
    pinned: true,
    toolbarHeight: 100,
    leadingWidth: 80,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 5,
        bottom: 0,
      ),
      child: Image.asset('assets/images/fake_user.png'),
    ),
    title: Text(
      "Salem, $username!✌",
      style: title2.copyWith(
        fontSize: 30,
        color: prTextColor(),
      ),
    ),
    centerTitle: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Icon(
          CupertinoIcons.line_horizontal_3_decrease,
          size: 30,
          color: prTextColor(),
        ),
      ),
    ],
  );
}

Widget _buildBanner() {
  return Container(
    height: 220,
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
                height: 220,
                width: 220,
                child: SvgPicture.asset(
                  'assets/icons/discount.svg',
                  fit: BoxFit.contain,
                )),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '72% OFF',
                  style: bodyText2.copyWith(fontSize: 18),
                ),
                Text(
                  '3D graphics for beginners',
                  style: title2.copyWith(color: Colors.white),
                ),
                Text(
                  'Basic knowledge required to create models for mobile and computer games',
                  style: subtitle1.copyWith(color: Colors.white),
                ),
                const SizedBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '19.99 \$ ',
                      style: title2.copyWith(color: Colors.white),
                    ),
                    Text(
                      '59.99 \$',
                      style: bodyText2.copyWith(
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCourses({required MainController controller}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
          (context, index) {
        return _buildSubjectItem(
          name: '${controller.state.courses[index].name}',
          author: '${controller.state.courses[index].owner}',
          price: '${(index + 15.99).toPrecision(2)}',
          picture: '${controller.state.courses[index].image_url}',
          gradient: controller.getGradient(index + 1),
        );
      },
      childCount: controller.state.courses.length,
    ),
  );
}

Widget _buildLoadingBanner() {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          height: 220.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 0.0, bottom: 20.0),
          width: 200,
          height: 50.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildLoadingCourses() {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
          height: 150.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
          height: 150.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
          height: 150.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
          height: 150.0,
          child: Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey.withOpacity(0.1),
            ]),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSubjectItem({
  required String name,
  required String author,
  required String price,
  required String picture,
  required Gradient gradient,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
    child: Container(
      padding: const EdgeInsets.only(top: 20,left: 20),
      height: 150,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: title2),
                  Text(
                    "Авторы: $author",
                    style: subtitle1.copyWith(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "$price ₸",
                    style: title2.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 120,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  picture,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}