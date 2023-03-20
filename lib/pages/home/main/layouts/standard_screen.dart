import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/routes/routes.dart';
import '../../../../common/values/values.dart';
import '../index.dart';

class StandardScreen extends GetView<MainController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.state.isMainPage.value =
                              MainSubjectPage.subjectPage;
                        },
                        child: Container(
                          decoration: controller.state.isMainPage.value ==
                                  MainSubjectPage.subjectPage
                              ? BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  border: const Border(
                                    bottom: BorderSide(color: Colors.blue),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Сабақтар",
                              style: title3.copyWith(
                                  color: controller.state.isMainPage.value ==
                                          MainSubjectPage.subjectPage
                                      ? Colors.blue
                                      : null),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.state.isMainPage.value =
                              MainSubjectPage.comboPage;
                        },
                        child: Container(
                          decoration: controller.state.isMainPage.value ==
                                  MainSubjectPage.comboPage
                              ? BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  border: const Border(
                                    bottom: BorderSide(color: Colors.blue),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "🔥Комбо",
                              style: title3.copyWith(
                                  color: controller.state.isMainPage.value ==
                                          MainSubjectPage.comboPage
                                      ? Colors.blue
                                      : null),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.state.isMainPage.value =
                              MainSubjectPage.myLessonsPage;
                        },
                        child: Container(
                          decoration: controller.state.isMainPage.value ==
                                  MainSubjectPage.myLessonsPage
                              ? BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  border: const Border(
                                    bottom: BorderSide(color: Colors.blue),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Сабақтарым",
                              style: title3.copyWith(
                                  color: controller.state.isMainPage.value ==
                                          MainSubjectPage.myLessonsPage
                                      ? Colors.blue
                                      : null),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.state.isMainPage.value == MainSubjectPage.subjectPage) {
          return _buildSubjectPage(controller: controller);
        } else if (controller.state.isMainPage.value ==
            MainSubjectPage.comboPage) {
          return _buildComboPage(controller: controller);
        } else {
          return _buildMyLessonsPage(controller: controller);
        }
      }),
    );
  }

  Widget _buildSubjectPage({required MainController controller}) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 243, 173, 61),
              Color.fromARGB(255, 246, 195, 92),
            ],
          ),
          subjectName: "Қазақстан тарихы",
          subjectImageUrl: "assets/images/ТАРИХ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 242, 161, 93),
              Color.fromARGB(255, 250, 223, 103),
            ],
          ),
          subjectName: "Математикалық сауаттылық",
          subjectImageUrl: "assets/images/МАТ САУАТТЫЛЫҚ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 196, 236, 119),
              Color.fromARGB(255, 111, 200, 148),
            ],
          ),
          subjectName: "Оқу сауаттылық",
          subjectImageUrl: "assets/images/ОҚУ САУАТТЫЛЫҚ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 134, 193, 244),
              Color.fromARGB(255, 109, 179, 242),
            ],
          ),
          subjectName: "Математика",
          subjectImageUrl: "assets/images/МАТЕМАТИКА.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 116, 218, 193),
              Color.fromARGB(255, 90, 176, 170),
            ],
          ),
          subjectName: "Физика",
          subjectImageUrl: "assets/images/ФИЗИКА.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 239, 142, 118),
              Color.fromARGB(255, 236, 100, 74),
            ],
          ),
          subjectName: "Биология",
          subjectImageUrl: "assets/images/БИОЛОГИЯ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 143, 90, 184),
              Color.fromARGB(255, 122, 77, 156),
            ],
          ),
          subjectName: "Химия",
          subjectImageUrl: "assets/images/ХИМИЯ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 66, 102, 204),
              Color.fromARGB(255, 151, 220, 252),
            ],
          ),
          subjectName: "География",
          subjectImageUrl: "assets/images/ГЕОГРАФИЯ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 80, 177, 202),
              Color.fromARGB(255, 161, 213, 241),
            ],
          ),
          subjectName: "Ағылшын тілі",
          subjectImageUrl: "assets/images/АҒЫЛШЫН.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 84, 172),
              Color.fromARGB(255, 166, 227, 250),
            ],
          ),
          subjectName: "Информатика",
          subjectImageUrl: "assets/images/ИНФОРМАТИКА.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 234, 79, 150),
              Color.fromARGB(255, 242, 169, 198),
            ],
          ),
          subjectName: "Қазақ әдебиеті",
          subjectImageUrl: "assets/images/КАЗ ӘДЕБИЕТІ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 242, 100, 100),
              Color.fromARGB(255, 234, 79, 150),
            ],
          ),
          subjectName: "Қазақ тілі",
          subjectImageUrl: "assets/images/КАЗАҚ ТІЛІ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 218, 131, 53),
              Color.fromARGB(255, 160, 105, 111),
            ],
          ),
          subjectName: "Орыс әдебиеті",
          subjectImageUrl: "assets/images/ОРЫС ӘДЕБИЕТ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 56, 128, 244),
              Color.fromARGB(255, 44, 102, 174),
            ],
          ),
          subjectName: "Орыс тілі",
          subjectImageUrl: "assets/images/ОРЫС ТІЛІ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 210, 55, 126),
              Color.fromARGB(255, 155, 52, 114),
            ],
          ),
          subjectName: "Дүние жүзі тарихы",
          subjectImageUrl: "assets/images/ДЖТ.png",
        ),
        _buildSubjectItem(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 240, 90, 90),
              Color.fromARGB(255, 234, 80, 84),
            ],
          ),
          subjectName: "Адам. Қоғам. Құқық",
          subjectImageUrl: "assets/images/АҚҚ.png",
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }

  Widget _buildComboPage({required MainController controller}) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://myexam.kz/images/courses/16792277497040149c-f9be-4efb-bfb2-773524dde262files.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Информатика және математика",
                              style: title3.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "- Математика",
                                  style: bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "- Информатика",
                                  style: bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "- Математикалық сауаттылық",
                                  style: bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "- Оқу сауаттылық",
                                  style: bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "- Қазақстан тарихы",
                                  style: bodyText2.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyLessonsPage({required MainController controller}) {
    return const Center(child: Text("Сіз ешқандай сабаққа тіркелмегенсіз!"),);
  }

  Widget _buildSubjectItem({
    required Gradient gradient,
    required String subjectName,
    required String subjectImageUrl,
  }) {
    return SliverToBoxAdapter(
      child: Container(
        height: 120,
        padding: const EdgeInsets.only(left: 15),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: title2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.subjectPage);
                    },
                    child: Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open_outlined,
                            size: 20,
                            color: Colors.black87,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Ашу',
                            style: subtitle2.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(subjectImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
