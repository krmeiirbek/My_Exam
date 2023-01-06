import 'package:get/get.dart';

enum AuthStatus {
  ok,
  error,
}

class AuthController extends GetxController {
  final login = "newkazybek@gmail.com".obs;
  final password = "qwerty12345".obs;

  AuthStatus check(String login, String password) {
    if (this.login.value == login && this.password.value == password) {
      return AuthStatus.ok;
    } else {
      return AuthStatus.error;
    }
  }
}
