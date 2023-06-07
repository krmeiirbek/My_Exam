import 'dart:convert';
import 'package:get/get.dart';

import '../entities/entities.dart';
import '../routes/routes.dart';
import '../services/services.dart';
import '../values/values.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  final _isFirstLogin = true.obs;
  String token = '';
  final _profile = UserItem().obs;

  bool get isLogin => _isLogin.value;
  bool get isFirstLogin => _isFirstLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    /// offline user
    token = StorageService.to.getString(storageUserTokenKey);
    var profileOffline = StorageService.to.getString(storageUserProfileKey);
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _isFirstLogin.value = false;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
    print("token in setToken $token");
    print(hasToken);
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    return StorageService.to.getString(storageUserProfileKey);
  }

  Future<void> saveProfile(UserItem profile, String token) async {
    await StorageService.to.setString(storageUserProfileKey, jsonEncode(profile));
    await setToken(token);
    _profile(profile);
    _isLogin.value = true;
    _isFirstLogin.value = false;
  }

  Future<void> onLogout() async {
     await StorageService.to.remove(storageUserTokenKey);
     await StorageService.to.remove(storageUserProfileKey);
     token = '';
     _isLogin.value = false;
    Get.offAllNamed(AppRoutes.signIn);
  }
}
