import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class QuizState {
  final testPage = EnumTestPage.private.obs;
  final isSelectedSubjects = false.obs;
  final subjects = [
    Subject(
      name: "Қазақстан тарихы",
      imageUrl: "assets/images/15.png",
    ),
    Subject(
      name: "Оқу сауаттылық",
      imageUrl: "assets/images/11.png",
    ),
    Subject(
      name: "Математикалық сауаттылық",
      imageUrl: "assets/images/7.png",
    ),
    Subject(
      name: "Математика",
      imageUrl: "assets/images/13.png",
    ),
    Subject(
      name: "Физика",
      imageUrl: "assets/images/9.png",
    ),
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/4.png",
    ),
    Subject(
      name: "География",
      imageUrl: "assets/images/2.png",
    ),
    Subject(
      name: "Биология",
      imageUrl: "assets/images/14.png",
    ),
    Subject(
      name: "Химия",
      imageUrl: "assets/images/8.png",
    ),
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/3.png",
    ),
    Subject(
      name: "Адам. Қоғам. Құқық",
      imageUrl: "assets/images/1.png",
    ),
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/16.png",
    ),
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/6.png",
    ),
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/5.png",
    ),
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/10.png",
    ),
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/12.png",
    ),
  ];

  final subject1 = Rxn<Subject>();
  final subject2 = Rxn<Subject>();
  final subjectsComplete = <Subject, List<Subject>>{
    Subject(
      name: "Математика",
      imageUrl: "assets/images/13.png",
    ): [
      Subject(
        name: "География",
        imageUrl: "assets/images/2.png",
      ),
      Subject(
        name: "Физика",
        imageUrl: "assets/images/9.png",
      ),
      Subject(
        name: "Информатика",
        imageUrl: "assets/images/4.png",
      ),
    ],
    Subject(
      name: "Физика",
      imageUrl: "assets/images/9.png",
    ): [
      Subject(
        name: "Химия",
        imageUrl: "assets/images/8.png",
      ),
      Subject(
        name: "Математика",
        imageUrl: "assets/images/13.png",
      ),
    ],
    Subject(
      name: "География",
      imageUrl: "assets/images/2.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/3.png",
      ),
      Subject(
        name: "Ағылшын тілі",
        imageUrl: "assets/images/16.png",
      ),
      Subject(
        name: "Математика",
        imageUrl: "assets/images/13.png",
      ),
      Subject(
        name: "Биология",
        imageUrl: "assets/images/14.png",
      ),
    ],
    Subject(
      name: "Биология",
      imageUrl: "assets/images/14.png",
    ): [
      Subject(
        name: "География",
        imageUrl: "assets/images/2.png",
      ),
      Subject(
        name: "Химия",
        imageUrl: "assets/images/8.png",
      ),
    ],
    Subject(
      name: "Химия",
      imageUrl: "assets/images/8.png",
    ): [
      Subject(
        name: "Физика",
        imageUrl: "assets/images/9.png",
      ),
      Subject(
        name: "Биология",
        imageUrl: "assets/images/14.png",
      ),
    ],
    Subject(
      name: "Информатика",
      imageUrl: "assets/images/4.png",
    ): [
      Subject(
        name: "Математика",
        imageUrl: "assets/images/13.png",
      ),
    ],
    Subject(
      name: "Дүниежүзі тарихы",
      imageUrl: "assets/images/3.png",
    ): [
      Subject(
        name: "Адам. Қоғам. Құқық",
        imageUrl: "assets/images/1.png",
      ),
      Subject(
        name: "Ағылшын тілі",
        imageUrl: "assets/images/16.png",
      ),
      Subject(
        name: "География",
        imageUrl: "assets/images/2.png",
      ),
    ],
    Subject(
      name: "Адам. Қоғам. Құқық",
      imageUrl: "assets/images/1.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/3.png",
      ),
    ],
    Subject(
      name: "Қазақ тілі",
      imageUrl: "assets/images/5.png",
    ): [
      Subject(
        name: "Қазақ әдебиеті",
        imageUrl: "assets/images/6.png",
      ),
    ],
    Subject(
      name: "Қазақ әдебиеті",
      imageUrl: "assets/images/6.png",
    ): [
      Subject(
        name: "Қазақ тілі",
        imageUrl: "assets/images/5.png",
      ),
    ],
    Subject(
      name: "Орыс тілі",
      imageUrl: "assets/images/12.png",
    ): [
      Subject(
        name: "Орыс әдебиеті",
        imageUrl: "assets/images/10.png",
      ),
    ],
    Subject(
      name: "Орыс әдебиеті",
      imageUrl: "assets/images/10.png",
    ): [
      Subject(
        name: "Орыс тілі",
        imageUrl: "assets/images/12.png",
      ),
    ],
    Subject(
      name: "Ағылшын тілі",
      imageUrl: "assets/images/16.png",
    ): [
      Subject(
        name: "Дүниежүзі тарихы",
        imageUrl: "assets/images/3.png",
      ),
      Subject(
        name: "География",
        imageUrl: "assets/images/2.png",
      ),
    ],
  };
}

enum EnumTestPage {
  private,
  complete,
}
