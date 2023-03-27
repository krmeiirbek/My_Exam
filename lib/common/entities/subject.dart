import 'entities.dart';

class Subject {
  final String name;
  final String? imageUrl;

  Subject({
    required this.name,
    this.imageUrl,
  });
}

class SubjectQuiz {
  final String name;
  final String? imageUrl;
  final List<QuestionItem> questions;

  SubjectQuiz({
    required this.name,
    this.imageUrl,
    required this.questions,
  });
}

class SubjectCourse {
  final String name;
  final String? imageUrl;
  final List<CourseItem>? courses;

  SubjectCourse({
    required this.name,
    this.imageUrl,
    this.courses,
  });
}
