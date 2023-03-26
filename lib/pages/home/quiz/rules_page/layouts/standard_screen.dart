import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/values/values.dart';
import '../controller.dart';

class StandardScreen extends GetView<RulesPageController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Тестілеу ережелері",
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 3,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Тестілеуге ${controller.time} сағат беріледі",
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.lock_open_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Қолдаңбаның премиум пайдаланушысы болсаңыз, сынақты шексіз тапсыра аласыз.",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.bookmark_added_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Барлық сұрақтарға жауап бергеннен кейін тестті аяқтаңыз.",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.newspaper_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Пәндер: мат. сауаттылық, математика, физика және химия есептердің толық жауаптары мен шешімдерін қамтиды.",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent.withOpacity(0.2)),
              child: const Text(
                "Шешімдерді жоғалтып алмау үшін тестілеу кезінде қосымшадан шықпаңыз",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Divider(color: Colors.grey.shade300, thickness: 3),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                controller.goTestPage();
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
                    'Бастау',
                    style: subtitle2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
