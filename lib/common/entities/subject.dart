import 'entities.dart';

class Subject {
  final String name;
  final String? imageUrl;
  final List<CourseItem>? courses;
  final List<QuestionItem>? questions;

  Subject({
    required this.name,
    this.imageUrl,
    this.courses,
    this.questions,
  });
}

