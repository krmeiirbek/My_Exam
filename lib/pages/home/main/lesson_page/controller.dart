import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'state.dart';

class LessonPageController extends GetxController {
  final state = LessonPageState();

  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;

  @override
  void onInit() {
    _videoPlayerController = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    )..addListener(() => update())
    ..setLooping(true)
    ..initialize().then((value) => _videoPlayerController.play());
    chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      systemOverlaysOnEnterFullScreen: [],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      systemOverlaysAfterFullScreen: SystemUiOverlay.values,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ]
    );
    super.onInit();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
