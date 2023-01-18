import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/controllers/leaderboard_controller.dart';

class LeaderboardPage extends GetView<LeaderboardController> {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 20),
              appBar(),
              SizedBox(height: 30),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    return ListView.separated(
                        itemCount: controller.users.length,
                        itemBuilder: (_,idx){
                          return leaderboardUser(name: controller.users[idx].name, point: controller.users[idx].point, id: controller.users[idx].id, image: '');
                        },
                      separatorBuilder: (_,__){
                          return SizedBox(height: 43);
                      },
                      padding: EdgeInsets.only(top: 40,bottom: 20),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBar() {
  return Row(
    children: [
      Spacer(),
      Text(
        'Leaderboard',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      Spacer(),
      Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            'assets/icons/notification.svg',
            color: Color(0xff3D3D74),
            height: 22,
          ),
          Positioned(
            top: -1,
            right: -8,
            child: Container(
              height: 14,
              width: 14,
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
    ],
  );
}

Widget leaderboardUser({
  required String? name,
  required int? point,
  required int? id,
  required String? image,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 60,
        decoration: BoxDecoration(
          color: (id??0)%2==0 ? const Color(0xffE3F0FF) :Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 90),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${point}XP',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff999999)),
                ),
              ],
            ),
            Spacer(),
            if(id==1)
              SvgPicture.asset('assets/icons/gold.svg'),
            if(id==2)
              SvgPicture.asset('assets/icons/silver.svg'),
            if(id==3)
              SvgPicture.asset('assets/icons/bronze.svg'),
            if((id??4) > 3)
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/icons/medal.svg'),
                  Positioned(
                    top: 5,
                      child: Text(id.toString())),
                ],
              ),
            SizedBox(width: 14),
            SvgPicture.asset('assets/icons/threeDotsMenu.svg'),
            SizedBox(width: 15),
          ],
        ),
      ),
      Positioned(
        top: -20,
        left: 14,
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            'assets/images/avatar.png',
          ),
        ),
      ),
    ],
  );
}
