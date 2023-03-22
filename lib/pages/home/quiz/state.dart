import 'package:get/get.dart';

class QuizState {
  final testPage = TestPage.private.obs;
  final isSelectedSubjects = false.obs;
  final subjects = [
    Subject(
      name: "Қазақстан тарихы",
      imageUrl: "assets/images/quiz/07.png",
    ),
    Subject(
      name: "Оқу сауаттылық",
      imageUrl: "assets/images/quiz/11.png",
    ),
    Subject(
      name: "Математикалық сауаттылық",
      imageUrl: "assets/images/quiz/10.png",
    ),
    Subject(
      name: "Математика",
      imageUrl: "assets/images/quiz/09.png",
    ),
    Subject(
      name: "Физика",
      imageUrl: "assets/images/quiz/14.png",
    ),
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/quiz/05.png",
    ),
    Subject(
      name: "География",
      imageUrl: "assets/images/quiz/03.png",
    ),
    Subject(
      name: "Биология",
      imageUrl: "assets/images/quiz/01.png",
    ),
    Subject(
      name: "Химия",
      imageUrl: "assets/images/quiz/15.png",
    ),
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/quiz/04.png",
    ),
    Subject(
      name: "Адам. Қоғам. Құқық",
      imageUrl: "assets/images/quiz/02.png",
    ),
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/quiz/16.png",
    ),
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/quiz/08.png",
    ),
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/quiz/06.png",
    ),
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/quiz/13.png",
    ),
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/quiz/12.png",
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
