import 'package:get/get.dart';

import '../../../common/store/store.dart';
import 'state.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  @override
  void onInit() {
    final user = UserStore.to.profile;
    state.name.value = user.email ?? "";
    super.onInit();
  }
}
