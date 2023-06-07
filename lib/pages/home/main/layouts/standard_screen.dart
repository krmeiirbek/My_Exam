import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
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
                                  border: Border(
                                    bottom: BorderSide(color: prColor()),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Сабақтар",
                              style: title3.copyWith(
                                color: controller.state.isMainPage.value ==
                                        MainSubjectPage.subjectPage
                                    ? prColor()
                                    : Colors.black87,
                              ),
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
                                  border: Border(
                                    bottom: BorderSide(color: prColor()),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "🎁",
                                  textAlign: TextAlign.center,
                                  style: title3.copyWith(
                                    color: controller.state.isMainPage.value ==
                                            MainSubjectPage.comboPage
                                        ? prColor()
                                        : Colors.black87,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Ұсыныстар",
                                    textAlign: TextAlign.center,
                                    style: title3.copyWith(
                                      color:
                                          controller.state.isMainPage.value ==
                                                  MainSubjectPage.comboPage
                                              ? prColor()
                                              : Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
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
                                  border: Border(
                                    bottom: BorderSide(color: prColor()),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Сабақтарым",
                              style: title3.copyWith(
                                color: controller.state.isMainPage.value ==
                                        MainSubjectPage.myLessonsPage
                                    ? prColor()
                                    : Colors.black87,
                              ),
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
        ...controller.state.subjects.reversed.map(
          (subject) => _buildSubjectItem(
            subject: subject
          ),
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
                            image: AssetImage('assets/images/solubility.jpg'),
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
                              style:
                                  title3.copyWith(fontWeight: FontWeight.bold),
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
    return const Center(
      child: Text("Сіз ешқандай сабаққа тіркелмегенсіз!"),
    );
  }

  Widget _buildSubjectItem({
    required Subject subject,
  }) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          controller.goSubjectPage(subject: subject);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(subject.image_url),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  subject.name,
                  textAlign: TextAlign.start,
                  style: title2.copyWith(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
