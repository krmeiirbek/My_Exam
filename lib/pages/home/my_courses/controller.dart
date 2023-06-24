import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/services/services.dart';
import 'package:my_exam/common/utils/http.dart';
import 'package:video_player/video_player.dart';

import 'state.dart';

class MyCoursesController extends GetxController {
  MyCoursesController();

  final state = MyCoursesState();
  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;

  setStatus(int status) async {
    state.status.value = status;
    await StorageService.to.setInt('video download status', status);
    update();
  }

  setFilePath(String filePath, int status) async {
    state.filePath.value = filePath;
    await StorageService.to.setString('video download filepath', filePath);
    setStatus(status);
    update();
  }

  void downloadProgress(int count, int total) {
    state.downloadPercentage.value = count / total;
    print(state.downloadPercentage.value);
    update();
  }

  @override
  void onInit() {
    state.status.value = StorageService.to.getInt('video download status');
    state.filePath.value =
        StorageService.to.getString('video download filepath');
    if (state.status.value == 0) {
      initNetworkPlayer();
    } else {
      initLocalPlayer();
    }
    super.onInit();
  }

  initNetworkPlayer() {
    print('network');
    _videoPlayerController = VideoPlayerController.network(
      state.videoURL.value,
    )
      ..addListener(() => update())
      ..setLooping(true)
      ..initialize();
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
        ]);
  }

  void initLocalPlayer() {
    print('local');
    _videoPlayerController =
        VideoPlayerController.file(File(state.filePath.value))
          ..addListener(() => update())
          ..setLooping(true)
          ..initialize();
    chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
        allowPlaybackSpeedChanging: false,
        showControls: true,
        aspectRatio: 16 / 9,
        systemOverlaysOnEnterFullScreen: [],
        deviceOrientationsOnEnterFullScreen: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ],
        systemOverlaysAfterFullScreen: SystemUiOverlay.values,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ]);
    update();
  }

  void downloadVideo() {
    HttpUtil().downloadFileLocally(
      state.videoURL.value,
      setStatus,
      setFilePath,
      downloadProgress: downloadProgress,
    );
  }

  void deleteVideo() {
    HttpUtil().deleteFileLocally(
      state.videoURL.value,
      setStatus,
    );
  }
}
