import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class StandardScreen extends GetView<LessonPageController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabak 0"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: controller.chewieController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
