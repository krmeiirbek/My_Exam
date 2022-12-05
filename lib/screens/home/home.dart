import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffF6F7FC),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 274,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff6FB2FF),
                    Color(0xff4785EB),
                  ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                  ),
                ),
              ),
              Positioned(
                right: 29,
                top: 54,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/notification.svg',
                      height: 23,
                      width: 18,
                    ),
                    Positioned(
                      top: -1,
                      right: -8,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Text(
                          '1',
                          style: TextStyle(
                            color: Color(0xffE3F0FF),
                            fontSize: 10,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 98,
                left: 29,
                child: RichText(
                  text: const TextSpan(
                    text: 'Hello,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                          text: '\nKazybek',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                          children: [
                            TextSpan(
                              text: '\nLet’s workout to get some gains',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 105,
                right: 29,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    height: 67,
                    width: 67,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 29,
                left: 29,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for name exam',
                      hintStyle: const TextStyle(
                        color: Color(0xffC3C3C3),
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              left: 12.0,
                              bottom: 12.0,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
              child: ListView.separated(
                itemBuilder: (_, idx) => Container(
                  height: 100,
                  color: Colors.blueAccent,
                ),
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 10,
                ),
                itemCount: 6,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/home.svg',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/surface.svg',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Leaderboard',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clock.svg',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'History',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
