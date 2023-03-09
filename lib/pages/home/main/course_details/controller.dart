import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'state.dart';

class CourseDetailsController extends GetxController {
  final state = CourseDetailsState();

  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'y8pIyJAFNVI',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        useHybridComposition: false,
      ),
    );
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }
}
