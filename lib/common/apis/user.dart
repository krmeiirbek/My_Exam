import '../entities/entities.dart';
import '../utils/utils.dart';

class UserAPI {
  static Future<UserLoginOrRegisterResponseEntity> login(
      {LoginOrRegisterRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/login',
      queryParameters: params?.toJson(),
    );
    return UserLoginOrRegisterResponseEntity.fromJson(response);
  }

  static Future<UserLoginOrRegisterResponseEntity> register(
      {LoginOrRegisterRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/register',
      queryParameters: params?.toJson(),
    );
    return UserLoginOrRegisterResponseEntity.fromJson(response);
  }

  static Future<CheckEmailResponseEntity> checkEmail(
      {CheckEmailRequestEntity? params}) async {
    var response = await HttpUtil().get(
      '/api/v1/auth/check-email',
      queryParameters: params?.toJson(),
    );
    return CheckEmailResponseEntity.fromJson(response);
  }

  static Future<GetMeResponseEntity> getMe() async {
    print("get me request");
    var response = await HttpUtil().get(
      '/api/v1/auth/me',
    );
    return GetMeResponseEntity.fromJson(response);
  }

// static Future<UserLoginResponseEntity> getProfile() async {
//   var response = await HttpUtil().post(
//     'api/get_profile',
//   );
//   return UserLoginResponseEntity.fromJson(response);
// }
//
// static Future<BaseResponseEntity> updateProfile({
//   LoginRequestEntity? params,
// }) async {
//   var response = await HttpUtil().post(
//     'api/update_profile',
//     queryParameters: params?.toJson(),
//   );
//   return BaseResponseEntity.fromJson(response);
// }
}
