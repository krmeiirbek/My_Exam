import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/common/widgets/glass_morphism.dart';

import '../../../common/values/values.dart';
import 'controller.dart';

class LeaderboardPage extends GetView<LeaderboardController> {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          child: GlassMorphism(
            blur: 20,
            opacity: 0.2,
            radius: 20,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name", style: subtitle1),
                          Text(
                            "Авторы: ",
                            style: bodyText1.copyWith(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            " ₸",
                            style: subtitle1.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/fake_user.png",
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
