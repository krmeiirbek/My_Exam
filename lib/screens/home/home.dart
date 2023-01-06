import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/configs/themes/app_colors.dart';
import 'package:my_exam/controllers/ubt_controller.dart';
import 'package:my_exam/screens/home/history/history.dart';
import 'package:my_exam/screens/home/leaderboard/leaderboard.dart';
import 'package:my_exam/screens/home/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  _showDialog() {
    Get.defaultDialog(
        title: "Welcome to MyExam",
        content: const Text('Update your level before starting the next step'));
  }

  _onTap(int index) {
    currentIndex = index;
    setState(() {});
  }

  final List<Widget> _pages = [
    const HomePage(),
    const LeaderboardPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height; // 932
    return Scaffold(
      backgroundColor: mainBackground(),
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        height: height * 0.086,
        decoration: BoxDecoration(
            color: bottomNavBarBackgroundColor(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _onTap(0);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: height * 0.027,
                    width: height * 0.027,
                    color: currentIndex == 0
                        ? Colors.lightBlue
                        : const Color(0xff666666),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: currentIndex == 0
                          ? Colors.lightBlue
                          : const Color(0xff666666),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _onTap(1);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/surface.svg',
                    height: height * 0.027,
                    width: height * 0.027,
                    color: currentIndex == 1
                        ? Colors.yellow
                        : const Color(0xff666666),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Leaderboard',
                    style: TextStyle(
                      color: currentIndex == 1
                          ? Colors.yellow
                          : const Color(0xff666666),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _onTap(2);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    height: height * 0.027,
                    width: height * 0.027,
                    color: currentIndex == 2
                        ? Colors.lightBlue
                        : const Color(0xff666666),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'History',
                    style: TextStyle(
                      color: currentIndex == 2
                          ? Colors.lightBlue
                          : const Color(0xff666666),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _onTap(3);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    height: height * 0.027,
                    width: height * 0.027,
                    color: currentIndex == 3
                        ? Colors.lightBlue
                        : const Color(0xff666666),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: currentIndex == 3
                          ? Colors.lightBlue
                          : const Color(0xff666666),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends GetView<UBTController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height; // 932
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.294,
              decoration: BoxDecoration(
                gradient: appBarGradient(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(height * 0.059),
                ),
              ),
            ),
            Positioned(
              right: height * 0.032,
              top: height * 0.058,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: height * 0.024,
                    width: height * 0.019,
                  ),
                  Positioned(
                    top: -height * 0.0011,
                    right: -height * 0.0086,
                    child: Container(
                      height: height * 0.016,
                      width: height * 0.016,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(
                          color: const Color(0xffE3F0FF),
                          fontSize: height * 0.0107,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.105,
              left: height * 0.032,
              child: RichText(
                text: TextSpan(
                  text: 'Hello,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.0183,
                  ),
                  children: [
                    TextSpan(
                      text: '\nKazybek',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.0365,
                      ),
                      children: [
                        TextSpan(
                          text: '\nLet’s workout to get some gains',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.014,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.113,
              right: height * 0.032,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: height * 0.072,
                  width: height * 0.072,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.032,
              right: height * 0.032,
              left: height * 0.032,
              child: Container(
                height: height * 0.048,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(height * 0.032),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for name exam',
                    hintStyle: const TextStyle(
                      color: Color(0xffC3C3C3),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: height * 0.0107),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.013,
                            left: height * 0.013,
                            bottom: height * 0.013,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.032,
                    right: height * 0.032,
                    left: height * 0.032,
                ),
                child: GridView.builder(
                  itemBuilder: (_, idx) => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffF9CF72),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22))),
                            child: SvgPicture.asset(
                              'assets/icons/subject_fone.svg',
                              width: 170,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        right: 15,
                        child: Text('${controller.subjects[idx].subjectName}'),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(
                    top: 0,
                    bottom: 10,
                  ),
                  itemCount: controller.subjects.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.9,
                  ),
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
