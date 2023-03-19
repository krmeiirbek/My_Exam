import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class MainState {
  final userName = "".obs;
  final isLoading = false.obs;
  final isMainPage = MainSubjectPage.subjectPage.obs;
  final courses = <CourseItem>[
    CourseItem(
      id: 1,
      name: "Қазақстан тарихы",
      description: "Қазақстан тарихы",
      image_url: "assets/images/kta.png",
      created_at: "",
      updated_at: "",
      owner: "Молдадосова Алтынай",
    ),
    CourseItem(
      id: 2,
      name: "Оқу сауаттылық",
      description: "Оқу сауаттылық",
      image_url: "assets/images/osa.png",
      created_at: "",
      updated_at: "",
      owner: "Оқу сауаттылық",
    ),
    CourseItem(
      id: 3,
      name: "Математикалық сауаттылық",
      description: "Математикалық сауаттылық",
      image_url: "assets/images/msa.png",
      created_at: "",
      updated_at: "",
      owner: "Математикалық сауаттылық",
    ),
    CourseItem(
      id: 4,
      name: "Математика",
      description: "Математика",
      image_url: "assets/images/mat.png",
      created_at: "",
      updated_at: "",
      owner: "Математика",
    ),
    CourseItem(
      id: 5,
      name: "Физика",
      description: "Физика",
      image_url: "assets/images/phy.png",
      created_at: "",
      updated_at: "",
      owner: "Физика",
    ),
    CourseItem(
      id: 6,
      name: "География",
      description: "География",
      image_url: "assets/images/geo.png",
      created_at: "",
      updated_at: "",
      owner: "География",
    ),
    CourseItem(
      id: 7,
      name: "Биология",
      description: "Биология",
      image_url: "assets/images/bio.png",
      created_at: "",
      updated_at: "",
      owner: "Биология",
    ),
    CourseItem(
      id: 8,
      name: "Химия",
      description: "Химия",
      image_url: "assets/images/che.png",
      created_at: "",
      updated_at: "",
      owner: "Химия",
    ),
    CourseItem(
      id: 9,
      name: "Информатика",
      description: "Информатика",
      image_url: "assets/images/inf.png",
      created_at: "",
      updated_at: "",
      owner: "Информатика",
    ),
    CourseItem(
      id: 10,
      name: "Дүниежүзі тарихы",
      description: "Дүниежүзі тарихы",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Молдадосова Алтынай",
    ),
    CourseItem(
      id: 11,
      name: "Құқық негіздері",
      description: "Құқық негіздері",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Молдадосова Алтынай",
    ),
    CourseItem(
      id: 12,
      name: "Қазақ тілі",
      description: "Қазақ тілі",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Қазақ тілі",
    ),
    CourseItem(
      id: 13,
      name: "Қазақ әдебиеті",
      description: "Қазақ әдебиеті",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Қазақ әдебиеті",
    ),
    CourseItem(
      id: 14,
      name: "Орыс тілі",
      description: "Орыс тілі",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Орыс тілі",
    ),
    CourseItem(
      id: 15,
      name: "Орыс әдебиеті",
      description: "Орыс әдебиеті",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Орыс әдебиеті",
    ),
    CourseItem(
      id: 16,
      name: "Ағылшын тілі",
      description: "Ағылшын тілі",
      image_url: "assets/images/dzt.png",
      created_at: "",
      updated_at: "",
      owner: "Ағылшын тілі",
    ),
  ].obs;
}

enum MainSubjectPage{
  subjectPage,
  comboPage,
  myLessonsPage,
}