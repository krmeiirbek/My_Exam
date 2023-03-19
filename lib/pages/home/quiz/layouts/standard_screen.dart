import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/glass_morphism.dart';
import '../controller.dart';
import '../../../../common/values/values.dart';
import '../state.dart';

class StandardScreen extends GetView<QuizController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "ҰБТ БАЙҚАУ СЫНАҒЫ",
          style: title2.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      body: Obx(() => Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GlassMorphism(
                  blur: 20,
                  opacity: 0.2,
                  radius: 5,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.changePage(TestPage.private);
                              },
                              child: Center(
                                child: Text(
                                  "ПӘН БОЙЫНША",
                                  style: subtitle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: controller.state.testPage.value ==
                                            TestPage.private
                                        ? Colors.deepPurpleAccent
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.changePage(TestPage.complete);
                              },
                              child: Center(
                                child: Text(
                                  "ТОЛЫҚ ҰБТ",
                                  style: subtitle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: controller.state.testPage.value ==
                                            TestPage.complete
                                        ? Colors.deepPurpleAccent
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              controller.state.testPage.value == TestPage.private
                  ? _buildSubjectTest()
                  : _buildCompleteTest(),
              const SizedBox(height: 20),
            ],
          )),
    );
  }

  Widget _buildSubjectTest() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          mainAxisExtent: 180,
        ),
        padding: const EdgeInsets.all(10),
        itemBuilder: (_, index) => Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent,
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2),
            ],
            image: DecorationImage(
                image: AssetImage(controller.state.subjects[index].imageUrl),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
        ),
        itemCount: controller.state.subjects.length,
      ),
    );
  }

  Widget _buildCompleteTest() {
    return Expanded(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Негізгі пәндер", style: title3),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurpleAccent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 2),
                        ],
                        image: DecorationImage(
                            image: AssetImage(
                                controller.state.subjects[0].imageUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurpleAccent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 2),
                        ],
                        image: DecorationImage(
                            image: AssetImage(
                                controller.state.subjects[1].imageUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurpleAccent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 2),
                        ],
                        image: DecorationImage(
                            image: AssetImage(
                                controller.state.subjects[2].imageUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text("Таңдау пәндер", style: title3),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                padding: const EdgeInsets.all(10),
                itemBuilder: (_, index) => Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurpleAccent,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 2),
                    ],
                    image: DecorationImage(
                        image: AssetImage(
                            controller.state.subjects[index + 3].imageUrl),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                  ),
                ),
                itemCount: controller.state.subjects.length - 3,
              ),
            ),
          ],
        ),
        floatingActionButton: controller.state.isSelectedSubjects.value ? Container(
          child: const Text("Тестілеуді бастау"),
        ) : null,
      ),
    );
  }
}
