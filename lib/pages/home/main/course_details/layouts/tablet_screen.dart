import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class TabletScreen extends GetView<CourseDetailsController> {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            actions: const [
              Icon(Icons.share),
              SizedBox(width: 20),
              Icon(Icons.shopping_cart_outlined),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: controller.chewieController,
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
