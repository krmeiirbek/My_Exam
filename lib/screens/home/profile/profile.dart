import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_exam/screens/home/profile/settings_page.dart';

import '../../../widgets/chart.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height; // 932
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: height * 0.294,
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
                right: height * 0.032,
                top: height * 0.058,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/notification.svg',
                      height: height * 0.025,
                      width: height * 0.019,
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
                top: height * 0.105,
                left: height * 0.032,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Kazybek',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/facebook.svg',
                          width: height * 0.016,
                          height: height * 0.016,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'krmeiirbek',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/twitter.svg',
                          width: height * 0.016,
                          height: height * 0.016,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'kazybek_meiirbek',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.113,
                right: height * 0.032,
                child: Stack(
                  children: [
                    Container(
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
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset(
                        'assets/icons/update.svg',
                        width: height * 0.021,
                        height: height * 0.021,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: height * 0.032,
                right: height * 0.032,
                left: height * 0.032,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '54',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Complete the exam',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '200',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Favourite',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.011),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: height * 0.022),
            child: const LineChartSample(),
          ),
          SizedBox(height: height * 0.032),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.032),
            child: SizedBox(
              height: height * 0.041,
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/payment.svg',
                      height: 20, width: 25),
                  SizedBox(width: height * 0.02),
                  const Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3D3D74),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3), size: 18),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: height * 0.032, left: height * 0.075),
            child: Divider(
              color: const Color(0xff707070).withOpacity(0.3),
              thickness: 2,
            ),
          ),
          SizedBox(width: height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.032),
            child: SizedBox(
              height: height * 0.041,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/friends.svg',
                    height: 20,
                    width: 25,
                  ),
                  SizedBox(width: height * 0.02),
                  const Text(
                    'Your friend',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3D3D74),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3), size: 18),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: height * 0.032, left: height * 0.075),
            child: Divider(
              color: const Color(0xff707070).withOpacity(0.3),
              thickness: 2,
            ),
          ),
          SizedBox(width: height * 0.02),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.032),
              child: SizedBox(
                height: height * 0.041,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(width: height * 0.02),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: height * 0.032, left: height * 0.075),
            child: Divider(
              color: const Color(0xff707070).withOpacity(0.3),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
