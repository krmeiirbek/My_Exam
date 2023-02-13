import 'package:get/get.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();

  onTap(int index) {
    state.currentIndex(index);
    update();
  }
}
