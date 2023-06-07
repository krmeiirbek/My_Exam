class GetAllCoursesResponseEntity {
  List<CourseItem>? courses;

  GetAllCoursesResponseEntity({this.courses});

  factory GetAllCoursesResponseEntity.fromJson(List<dynamic> json) =>
      GetAllCoursesResponseEntity(
        courses: json.map((e) => CourseItem.fromJson(e)).toList(),
      );
}

class CourseItem {
  int id;
  String name;
  String description;
  String image_url;
  String created_at;
  String updated_at;
  String owner;

  CourseItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image_url,
    required this.created_at,
    required this.updated_at,
    required this.owner,
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

class ChapterItem {
  int? id;
  String? name;
  List<LessonItem>? lessons;

  ChapterItem({
    this.id,
    this.name,
    this.lessons,
  });

  factory ChapterItem.fromJson(Map<String, dynamic> json) => ChapterItem(
        id: json["id"],
        name: json["name"],
        lessons: json["lessons"]
            .map((lesson) => LessonItem.fromJson(lesson))
            .toList(),
      );
}

class LessonItem {
  int? id;
  String? name;
  String? description;
  String? video_url;

  LessonItem({
    this.id,
    this.name,
    this.description,
    this.video_url,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) => LessonItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        video_url: json["video_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "video_url": video_url,
      };
}
