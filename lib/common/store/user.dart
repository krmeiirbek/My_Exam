import 'dart:convert';
import 'package:get/get.dart';

import '../entities/entities.dart';
import '../routes/routes.dart';
import '../services/services.dart';
import '../values/values.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _profile = UserItem().obs;

  bool get isLogin => _isLogin.value;

  UserItem get profile => _profile.value;

  bool get hasToken => token.isNotEmpty;

  /*

  late FirebaseAuth _auth;

  final _user = Rxn<User>();

  void initAuth() async {
    _auth = FirebaseAuth.instance;
  }

  User? get user {
    _user.value = _auth.currentUser;
    return _user.value;
  }
  */

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(storageUserTokenKey);
    var profileOffline = StorageService.to.getString(storageUserProfileKey);
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    return StorageService.to.getString(storageUserProfileKey);
  }

  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    StorageService.to.setString(storageUserProfileKey, jsonEncode(profile));
    _profile(profile);
    setToken(profile.access_token!);
  }

  Future<void> onLogout() async {
    //  await StorageService.to.remove(storageUserTokenKey);
    //  await StorageService.to.remove(storageUserProfileKey);
    //  _isLogin.value = false;
    //  token = '';
    Get.offAllNamed(AppRoutes.signIn);
  }
}
