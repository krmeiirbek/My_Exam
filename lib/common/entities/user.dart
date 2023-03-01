class LoginOrRegisterRequestEntity {
  String? email;
  String? first_name;
  String? last_name;
  String? password;

  LoginOrRegisterRequestEntity({
    this.email,
    this.first_name,
    this.last_name,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "password": password,
      };
}

class UserLoginOrRegisterResponseEntity {
  String? token;
  UserItem? user;

  UserLoginOrRegisterResponseEntity({
    this.token,
    this.user,
  });

  factory UserLoginOrRegisterResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      UserLoginOrRegisterResponseEntity(
        token: json["token"],
        user: UserItem.fromJson(json["user"]),
      );
}

class RegisterSendCodeRequestEntity {
  String? email;

  RegisterSendCodeRequestEntity({
    this.email,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}

class RegisterSendCodeResponseEntity {
  String? message;

  RegisterSendCodeResponseEntity({
    this.message,
  });

  factory RegisterSendCodeResponseEntity.fromJson(
      Map<String, dynamic> json) =>
      RegisterSendCodeResponseEntity(
        message: json["message"],
      );
}

class RegisterCheckCodeRequestEntity {
  String? email;
  String? code;

  RegisterCheckCodeRequestEntity({
    this.email,
    this.code,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code,
  };
}

class RegisterCheckCodeResponseEntity {
  bool? success;

  RegisterCheckCodeResponseEntity({
    this.success,
  });

  factory RegisterCheckCodeResponseEntity.fromJson(
      Map<String, dynamic> json) =>
      RegisterCheckCodeResponseEntity(
        success: json["success"],
      );
}

class GetMeResponseEntity {
  UserItem? user;

  GetMeResponseEntity({this.user});

  factory GetMeResponseEntity.fromJson(Map<String, dynamic> json) =>
      GetMeResponseEntity(
        user: UserItem.fromJson(json["user"]),
      );
}

class CheckEmailRequestEntity {
  String? email;

  CheckEmailRequestEntity({this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}

class CheckEmailResponseEntity {
  bool? exists;

  CheckEmailResponseEntity({this.exists});

  factory CheckEmailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CheckEmailResponseEntity(
        exists: json['exists'],
      );
}

class UserItem {
  String? email;
  String? first_name;
  String? last_name;
  int? role_id;
  int? id;
  int? verified;

  UserItem({
    this.email,
    this.first_name,
    this.last_name,
    this.role_id,
    this.id,
    this.verified,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        role_id: json["role_id"],
        id: json["id"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "role_id": role_id,
        "id": id,
        "verified": verified,
      };
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
