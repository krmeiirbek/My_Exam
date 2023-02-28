class LoginOrRegisterRequestEntity {
  String? email;
  String? password;

  LoginOrRegisterRequestEntity({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
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
  int? role_id;
  int? id;
  int? verified;

  UserItem({
    this.email,
    this.role_id,
    this.id,
    this.verified,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        email: json["email"],
        role_id: json["role_id"],
        id: json["id"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
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
