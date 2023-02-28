import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/values/values.dart';
import 'controller.dart';

class MyCoursesPage extends GetView<MyCoursesController> {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("My Courses"),
            centerTitle: false,
            pinned: true,
          ),
          _subjectItem(),
          _subjectItem(),
          _subjectItem(),
          _subjectItem(),
          _subjectItem(),
          _subjectItem(),
          _subjectItem(),
        ],
      ),
    );
  }
}

Widget _subjectItem() {
  return SliverToBoxAdapter(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      decoration: BoxDecoration(
        color: secondaryBackground(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: (){
          Get.to<SubjectDetails>(() => const SubjectDetails());
        },
        child: Row(
          children: [
            Container(
              width: 100,
              height: 80,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/bio.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Biology 2023 - Basic course",style: subtitle1,),
                    Row(
                      children: [
                        Text("by Kazybek, ",style: bodyText1.copyWith(fontWeight: FontWeight.w300),),
                        SvgPicture.asset('assets/icons/clock.svg',height: 12,color: secondaryTextColor(),),
                        const Text(" 12h", style: bodyText2,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CircularPercentIndicator(
              percent: 0.8,
              radius: 30,
              backgroundColor: prBackground(),
              progressColor: Colors.blue,
              center: const Text(
                "80%",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
            expandedHeight: 275,
            backgroundColor: prBackground(),
            pinned: true,
            stretch: true,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/bio.jpeg',
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 32.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: prBackground(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff666666).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2.5)),
                ),
              ),
            ),
            leadingWidth: 80.0,
            leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(56.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: 56.0,
                      width: 56.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What is biology?",
                    style: title2,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bio.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bio.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bio.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bio.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
