import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../../../../common/values/values.dart';
import '../state.dart';

class StandardScreen extends GetView<QuizController> {
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
                          controller.changePage(EnumTestPage.private);
                        },
                        child: Container(
                          decoration: controller.state.testPage.value ==
                                  EnumTestPage.private
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: prColor()),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Пән бойынша",
                              style: title3.copyWith(
                                color: controller.state.testPage.value ==
                                        EnumTestPage.private
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
                          controller.changePage(EnumTestPage.complete);
                        },
                        child: Container(
                          decoration: controller.state.testPage.value ==
                                  EnumTestPage.complete
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: prColor()),
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Толық ҰБТ",
                              style: title3.copyWith(
                                color: controller.state.testPage.value ==
                                        EnumTestPage.complete
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
      body: Obx(() => Column(
            children: [
              controller.state.testPage.value == EnumTestPage.private
                  ? _buildSubjectTest()
                  : _buildCompleteTest(),
              const SizedBox(height: 20),
            ],
          )),
    );
  }

  Widget _buildSubjectTest() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('${controller.state.subjects[index].imageUrl}'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                      controller.state.subjects[index].name,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.state.subjects.length,
        ),
      ),
    );
  }

  Widget _buildCompleteTest() {
    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Негізгі таңдалған пәндер",
                style: title3.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: prColor()),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Қазақстан тарихы.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                        child: Text(
                      'Қазақстан тарихы',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.check,
                      color: prColor(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: prColor()),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Оқу сауаттылық.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Оқу сауаттылық',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.check,
                      color: prColor(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: prColor()),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Математикалық сауаттылық.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Математикалық сауаттылық',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.check,
                      color: prColor(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade300, thickness: 3),
              const SizedBox(height: 15),
              Obx(() => Column(
                    children: [
                      Text(
                        "Таңдау пәндерің қандай?",
                        style: title3.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          value: controller.state.subject1.value,
                          hint: const Text("Бірінші пән"),
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(10),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Өзгерту',
                                style: TextStyle(
                                  color: prColor(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: prColor(),
                                size: 13,
                              ),
                            ],
                          ),
                          items: controller.state.subjectsComplete.keys.map(
                            (subject) {
                              return DropdownMenuItem(
                                value: subject,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage('${subject.imageUrl}'),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      subject.name,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (newItem) {
                            controller.state.subject1.value = newItem;
                            controller.state.subject2.value = null;
                          },
                          isExpanded: true,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          value: controller.state.subject2.value,
                          hint: const Text("Екінші пән"),
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(10),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Өзгерту',
                                style: TextStyle(
                                  color: prColor(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: prColor(),
                                size: 13,
                              ),
                            ],
                          ),
                          items: controller.state
                              .subjectsComplete[controller.state.subject1.value]
                              ?.map(
                                (subject) => DropdownMenuItem(
                                  value: subject,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage('${subject.imageUrl}'),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        subject.name,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newItem) {
                            controller.state.subject2.value = newItem;
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  )),
              const Spacer(),
              Divider(color: Colors.grey.shade300, thickness: 3),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  controller.goRulesPage();
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: prColor(),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: secondaryColor().withOpacity(0.4),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Келесі',
                      style: subtitle2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
