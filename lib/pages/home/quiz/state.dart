import 'package:get/get.dart';

class QuizState {
  final testPage = TestPage.private.obs;
  final isSelectedSubjects = false.obs;
  final subjects = [
    Subject(
      name: "Қазақстан тарихы",
      imageUrl: "assets/images/quiz/казахстан тарихы.png",
    ),
    Subject(
      name: "Оқу сауаттылық",
      imageUrl: "assets/images/quiz/оқу сауаттылық.png",
    ),
    Subject(
      name: "Математикалық сауаттылық",
      imageUrl: "assets/images/quiz/математикалық сауаттылық.png",
    ),
    Subject(
      name: "Математика",
      imageUrl: "assets/images/quiz/математика.png",
    ),
    Subject(
      name: "Физика",
      imageUrl: "assets/images/quiz/физика.png",
    ),
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/quiz/информатика.png",
    ),
    Subject(
      name: "География",
      imageUrl: "assets/images/quiz/география.png",
    ),
    Subject(
      name: "Биология",
      imageUrl: "assets/images/quiz/биология.png",
    ),
    Subject(
      name: "Химия",
      imageUrl: "assets/images/quiz/химия.png",
    ),
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/quiz/дуниежузи тарихы.png",
    ),
    Subject(
      name: "Құқық негіздері",
      imageUrl: "assets/images/quiz/адам қоғам құқық.png",
    ),
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/quiz/английский.png",
    ),
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/quiz/қазақ әдебиеті.png",
    ),
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/quiz/казак тили.png",
    ),
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/quiz/орыс әдебиеті.png",
    ),
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/quiz/орыс тили.png",
    ),
  ];
}

class Subject {
  String name;
  String imageUrl;

  Subject({required this.name, required this.imageUrl});
}

enum TestPage {
  private,
  complete,
}
