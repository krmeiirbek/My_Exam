import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/datasources/network_to_local_file.dart';
import '../controller.dart';

class MobileScreen extends GetView<MyCoursesController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video download example"),
        centerTitle: false,
        elevation: 1,
      ),
      body: Obx(() {
        if (controller.state.status.value == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: controller.chewieController,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: controller.downloadVideo,
                child: const Text(
                  'Download',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        } else if (controller.state.status.value == 1) {
          return Column(
            children: [
              CircularProgressIndicator(
                  value: controller.state.downloadPercentage.value)
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: controller.chewieController,
                  ),
                ),
              ),
              const Text(
                'Downloaded',
              ),
              ElevatedButton(
                onPressed: controller.deleteVideo,
                child: const Text(
                  'delete video from local',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }
      }),
    );
  }
}
