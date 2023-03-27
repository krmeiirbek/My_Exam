import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class QuizState {
  final testPage = EnumTestPage.private.obs;
  final isSelectedSubjects = false.obs;
  final subjects = [
    Subject(
      name: "Қазақстан тарихы",
      imageUrl: "assets/images/Қазақстан тарихы.png",
    ),
    Subject(
      name: "Оқу сауаттылық",
      imageUrl: "assets/images/Оқу сауаттылық.png",
    ),
    Subject(
      name: "Математикалық сауаттылық",
      imageUrl: "assets/images/Математикалық сауаттылық.png",
    ),
    Subject(
      name: "Математика",
      imageUrl: "assets/images/Математика.png",
    ),
    Subject(
      name: "Физика",
      imageUrl: "assets/images/Физика.png",
    ),
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/Информатика.png",
    ),
    Subject(
      name: "География",
      imageUrl: "assets/images/География.png",
    ),
    Subject(
      name: "Биология",
      imageUrl: "assets/images/Биология.png",
    ),
    Subject(
      name: "Химия",
      imageUrl: "assets/images/Химия.png",
    ),
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/Дүниежүзі тарихы.png",
    ),
    Subject(
      name: "Адам. Қоғам. Құқық",
      imageUrl: "assets/images/Адам. Қоғам. Құқық.png",
    ),
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/Ағылшын тілі.png",
    ),
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/Қазақ әдебиеті.png",
    ),
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/Қазақ тілі.png",
    ),
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/Орыс әдебиеті.png",
    ),
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/Орыс тілі.png",
    ),
  ];

  final subject1 = Rxn<Subject>();
  final subject2 = Rxn<Subject>();
  final subjectsComplete = <Subject, List<Subject>>{
    Subject(
      name: "Математика",
      imageUrl: "assets/images/Математика.png",
    ): [
      Subject(
        name: "География",
        imageUrl: "assets/images/География.png",
      ),
      Subject(
        name: "Физика",
        imageUrl: "assets/images/Физика.png",
      ),
      Subject(
        name: "Информатика",
        imageUrl: "assets/images/Информатика.png",
      ),
    ],
    Subject(
      name: "Физика",
      imageUrl: "assets/images/Физика.png",
    ): [
      Subject(
        name: "Химия",
        imageUrl: "assets/images/Химия.png",
      ),
      Subject(
        name: "Математика",
        imageUrl: "assets/images/Математика.png",
      ),
    ],
    Subject(
      name: "География",
      imageUrl: "assets/images/География.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/Дүниежүзі тарихы.png",
      ),
      Subject(
        name: "Ағылшын тілі",
        imageUrl: "assets/images/Ағылшын тілі.png",
      ),
      Subject(
        name: "Математика",
        imageUrl: "assets/images/Математика.png",
      ),
      Subject(
        name: "Биология",
        imageUrl: "assets/images/Биология.png",
      ),
    ],
    Subject(
      name: "Биология",
      imageUrl: "assets/images/Биология.png",
    ): [
      Subject(
        name: "География",
        imageUrl: "assets/images/География.png",
      ),
      Subject(
        name: "Химия",
        imageUrl: "assets/images/Химия.png",
      ),
    ],
    Subject(
      name: "Химия",
      imageUrl: "assets/images/Химия.png",
    ): [
      Subject(
        name: "Физика",
        imageUrl: "assets/images/Физика.png",
      ),
      Subject(
        name: "Биология",
        imageUrl: "assets/images/Биология.png",
      ),
    ],
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/Информатика.png",
    ): [
      Subject(
        name: "Математика",
        imageUrl: "assets/images/Математика.png",
      ),
    ],
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/Дүниежүзі тарихы.png",
    ): [
      Subject(
        name: "Адам. Қоғам. Құқық",
        imageUrl: "assets/images/Адам. Қоғам. Құқық.png",
      ),
      Subject(
        name: "Ағылшын тілі",
        imageUrl: "assets/images/Ағылшын тілі.png",
      ),
      Subject(
        name: "География",
        imageUrl: "assets/images/География.png",
      ),
    ],
    Subject(
      name: "Адам. Қоғам. Құқық",
      imageUrl: "assets/images/Адам. Қоғам. Құқық.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/Дүниежүзі тарихы.png",
      ),
    ],
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/Қазақ тілі.png",
    ): [
      Subject(
        name: "Қазақ әдебиеті",
        imageUrl: "assets/images/Қазақ әдебиеті.png",
      ),
    ],
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/Қазақ әдебиеті.png",
    ): [
      Subject(
        name: "Қазақ тілі",
        imageUrl: "assets/images/Қазақ тілі.png",
      ),
    ],
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/Орыс тілі.png",
    ): [
      Subject(
        name: "Орыс әдебиеті",
        imageUrl: "assets/images/Орыс әдебиеті.png",
      ),
    ],
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/Орыс әдебиеті.png",
    ): [
      Subject(
        name: "Орыс тілі",
        imageUrl: "assets/images/Орыс тілі.png",
      ),
    ],
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/Ағылшын тілі.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/Дүниежүзі тарихы.png",
      ),
      Subject(
        name: "География",
        imageUrl: "assets/images/География.png",
      ),
    ],
  };
}

enum EnumTestPage {
  private,
  complete,
}
