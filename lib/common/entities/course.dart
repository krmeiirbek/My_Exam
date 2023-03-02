class GetAllCoursesResponseEntity {
  List<CourseItem>? courses;

  GetAllCoursesResponseEntity({this.courses});

  factory GetAllCoursesResponseEntity.fromJson(List<dynamic> json) =>
      GetAllCoursesResponseEntity(
        courses: json.map((e) => CourseItem.fromJson(e)).toList(),
      );
}


class CourseItem {
  int? id;
  String? name;
  String? description;
  String? image_url;
  String? created_at;
  String? updated_at;
  String? owner;

  CourseItem({
    this.id,
    this.name,
    this.description,
    this.image_url,
    this.created_at,
    this.updated_at,
    this.owner,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image_url: json["image_url"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": image_url,
        "created_at": created_at,
        "updated_at": updated_at,
        "owner": owner,
      };
}
