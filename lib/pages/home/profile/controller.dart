import 'package:get/get.dart';
import 'package:my_exam/common/store/store.dart';

import 'state.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  void signOut() {
    UserStore.to.onLogout();
  }

}
