import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/chart.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          width: 15,
                          height: 15,
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
                          width: 15,
                          height: 15,
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
                top: 105,
                right: 29,
                child: Stack(
                  children: [
                    Container(
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
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset(
                        'assets/icons/update.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                right: 29,
                left: 29,
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: LineChartSample(),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 38,
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/payment.svg',height: 20,width: 25,),
                  const SizedBox(width: 18,),
                  const Text('Payment',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3D3D74),
                  ),),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffC3C3C3),size: 18,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 70),
            child: Divider(
              color: const Color(0xff707070).withOpacity(0.3),
              thickness: 2,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 38,
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/friends.svg',height: 20,width: 25,),
                  const SizedBox(width: 18,),
                  const Text('Your friend',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3D3D74),
                  ),),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffC3C3C3),size: 18,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 70),
            child: Divider(
              color: const Color(0xff707070).withOpacity(0.3),
              thickness: 2,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 38,
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/settings.svg',height: 20,width: 25,),
                  const SizedBox(width: 18,),
                  const Text('Settings',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3D3D74),
                  ),),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffC3C3C3),size: 18,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 70),
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
