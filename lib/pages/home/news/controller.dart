import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/values/values.dart';
import 'state.dart';

class NewsController extends GetxController {
  NewsController();

  final state = NewsState();

  void openUBTFormatTest() {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 400,
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Таңдау пәндерің қандай?", style: title3),
                DropdownButton(
                  value: state.firstSubject.value,
                  hint: const Text("Бірінші пән"),
                  items: state.subjects.keys.map(
                        (subject) {
                      return DropdownMenuItem(
                        value: subject,
                        child: Text(subject),
                      );
                    },
                  ).toList(),
                  onChanged: (newItem) {
                    state.firstSubject.value = newItem;
                    state.secondSubject.value = null;
                  },
                  isExpanded: true,
                ),
                DropdownButton(
                  value: state.secondSubject.value,
                  hint: const Text("Екінші пән"),
                  items: state.subjects[state.firstSubject.value]
                      ?.map(
                        (e) => DropdownMenuItem(value: e, child: Text(e)),
                  )
                      .toList(),
                  onChanged: (newItem) {
                    state.secondSubject.value = newItem;
                  },
                  isExpanded: true,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: prColor(),
                      borderRadius: BorderRadius.circular(15),
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
                        'Тесті бастау',
                        style: subtitle2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
      name: "ubtFormat",
    );
  }

  void openSubjectTest() {

  }

}
