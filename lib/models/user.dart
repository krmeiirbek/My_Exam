class User {
  int? id;
  String? name;
  int? point;
  String? image;

  User({this.id, this.name, this.point, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = json['point'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['point'] = point;
    data['image'] = image;
    return data;
  }
}