import 'entities.dart';

class GetAllSubjectsResponseEntity {
  List<Subject>? subjects;

  GetAllSubjectsResponseEntity({this.subjects});

  factory GetAllSubjectsResponseEntity.fromJson(List<dynamic> json) =>
      GetAllSubjectsResponseEntity(
        subjects: json.map((e) => Subject.fromJson(e)).toList(),
      );
}

class GetAllSubjectsRequestEntity {
  String? page;
  GetAllSubjectsRequestEntity({this.page});
  Map<String, String?> toJson() => {
    "page": page,
  };
}

class Subject {
  final int id;
  final String name;
  final String image_url;

  Subject({
    required this.id,
    required this.name,
    required this.image_url,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        image_url: json["icon_url"],
      );

  Map<String, String> toJson() => {
        "id": id.toString(),
        "name": name,
        "icon_url": image_url,
      };
}


class SubjectQuiz {
  final int id;
  final String name;
  final String image_url;
  final List<QuestionItem> questions;

  SubjectQuiz({
    required this.id,
    required this.name,
    required this.image_url,
    required this.questions,
  });
}

class SubjectCourse {
  final int id;
  final String name;
  final String image_url;
  final List<CourseItem>? courses;

  SubjectCourse({
    required this.id,
    required this.name,
    required this.image_url,
    this.courses,
  });
}
