import '../entities/entities.dart';
import '../utils/utils.dart';

class UserAPI {
  /// login
  static Future<UserLoginOrRegisterResponseEntity> login(
      {LoginOrRegisterRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/login',
      queryParameters: params?.toJson(),
    );
    return UserLoginOrRegisterResponseEntity.fromJson(response);
  }

  /// register
  static Future<UserLoginOrRegisterResponseEntity> register(
      {LoginOrRegisterRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/register',
      queryParameters: params?.toJson(),
    );
    return UserLoginOrRegisterResponseEntity.fromJson(response);
  }

  /// check email
  static Future<CheckEmailResponseEntity> checkEmail(
      {CheckEmailRequestEntity? params}) async {
    var response = await HttpUtil().get(
      '/api/v1/auth/check-email',
      queryParameters: params?.toJson(),
    );
    return CheckEmailResponseEntity.fromJson(response);
  }

  /// register send code
  static Future<RegisterSendCodeResponseEntity> sendCode(
      {RegisterSendCodeRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/register/send-code',
      queryParameters: params?.toJson(),
    );
    return RegisterSendCodeResponseEntity.fromJson(response);
  }

  /// register check code
  static Future<RegisterCheckCodeResponseEntity> checkCode(
      {RegisterCheckCodeRequestEntity? params}) async {
    var response = await HttpUtil().get(
      '/api/v1/auth/register/check-code',
      queryParameters: params?.toJson(),
    );
    return RegisterCheckCodeResponseEntity.fromJson(response);
  }

  /// get me
  static Future<GetMeResponseEntity> getMe() async {
    var response = await HttpUtil().get(
      '/api/v1/auth/me',
    );
    return GetMeResponseEntity.fromJson(response);
  }
}
