import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/values.dart';
import '../controller.dart';

class StandardScreen extends GetView<ProfileController> {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: prBackground(),
            pinned: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: () {
                    controller.signOut();
                  },
                  highlightColor: Colors.transparent,
                  child: Center(
                    child: Text(
                      "Шығу",
                      style: subtitle2.copyWith(color: prColor()),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Баптаулар",
                style: title2.copyWith(color: prTextColor(),fontWeight: FontWeight.bold),
              ),
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 20,bottom: 30),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.person_2_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Профиль",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.phone_iphone_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Біздің әлеуметтік желілер",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.card_giftcard_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Бонустар алу",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.newspaper_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Жаңалықтар",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.paste_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Нұсқаулық",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.help_outline,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Қолдау қызметі",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.lock_outline,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Құпия сөзді өзгерту",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: prBackground(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(
                          Icons.language_outlined,
                          color: prColor(),
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Интерфейс тілі",
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
