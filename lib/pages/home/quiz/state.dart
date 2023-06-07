import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class QuizState {
  final testPage = EnumTestPage.private.obs;
  final isSelectedSubjects = false.obs;
  static final kazTar = Subject(id: 1, name: "Қазақстан тарихы", image_url: "assets/images/Қазақстан тарихы.png");
  static final matSau = Subject(id: 2, name: "Математикалық сауаттылық", image_url: "assets/images/Математикалық сауаттылық.png");
  static final okuSau = Subject(id: 3, name: "Оқу сауаттылық", image_url: "assets/images/Оқу сауаттылық.png");
  static final mat = Subject(id: 4, name: "Математика", image_url: "assets/images/Математика.png");
  static final fiz = Subject(id: 5, name: "Физика", image_url: "assets/images/Физика.png");
  static final inf = Subject(id: 6, name: "Информатика", image_url: "assets/images/Информатика.png");
  static final geo = Subject(id: 7, name: "География", image_url: "assets/images/География.png");
  static final bio = Subject(id: 8, name: "Биология", image_url: "assets/images/Биология.png");
  static final him = Subject(id: 9, name: "Химия", image_url: "assets/images/Химия.png");
  static final dzt = Subject(id: 10, name: "Дүниежүзі тарихы", image_url: "assets/images/Дүниежүзі тарихы.png");
  static final akk = Subject(id: 11, name: "Адам. Қоғам. Құқық", image_url: "assets/images/Адам. Қоғам. Құқық.png");
  static final eng = Subject(id: 12, name: "Ағылшын тілі", image_url: "assets/images/Ағылшын тілі.png");
  static final kazAde = Subject(id: 13, name: "Қазақ әдебиеті", image_url: "assets/images/Қазақ әдебиеті.png");
  static final kazTil = Subject(id: 14, name: "Қазақ тілі", image_url: "assets/images/Қазақ тілі.png");
  static final rusAde = Subject(id: 15, name: "Орыс әдебиеті", image_url: "assets/images/Орыс әдебиеті.png");
  static final rusTil = Subject(id: 16, name: "Орыс тілі", image_url: "assets/images/Орыс тілі.png");
  final subjects = <Subject>[
    kazTar,
    matSau,
    okuSau,
    mat,
    fiz,
    inf,
    geo,
    bio,
    him,
    dzt,
    akk,
    eng,
    kazAde,
    kazTil,
    rusAde,
    rusTil,
  ];

  final subject1 = Rxn<Subject>();
  final subject2 = Rxn<Subject>();
  final subjectsComplete = <Subject, List<Subject>>{
    mat: [
      geo,
      fiz,
      inf,
    ],
    fiz: [
      him,
      mat,
    ],
    geo: [
      dzt,
      eng,
      mat,
      bio,
    ],
    bio: [
      geo,
      him,
    ],
    him: [
      fiz,
      bio,
    ],
    inf: [
      mat,
    ],
    dzt: [
      akk,
      eng,
      geo,
    ],
    akk: [
      dzt,
    ],
    kazTil: [
      kazAde,
    ],
    kazAde: [
      kazTil,
    ],
    rusTil: [
      rusAde,
    ],
    rusAde: [
      rusTil,
    ],
    eng: [
      dzt,
      geo,
    ],
  };
}

enum EnumTestPage {
  private,
  complete,
}
