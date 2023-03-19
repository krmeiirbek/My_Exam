import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/utils.dart';
import 'layouts/layouts.dart';
import 'controller.dart';

class QuizPage extends GetView<QuizController> {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        smallMobile: NarrowScreen(),
        mobile: StandardScreen(),
        tablet: TabletScreen(),
      ),
    );
  }
}
//           SliverAppBar(
//             systemOverlayStyle: const SystemUiOverlayStyle(
//               statusBarBrightness: Brightness.dark,
//             ),
//             expandedHeight: 275,
//             backgroundColor: prBackground(),
//             pinned: true,
//             stretch: true,
//             elevation: 0.0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.asset(
//                 'assets/images/bio.jpeg',
//                 fit: BoxFit.cover,
//               ),
//               stretchModes: const [
//                 StretchMode.blurBackground,
//                 StretchMode.zoomBackground,
//               ],
//             ),
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(0.0),
//               child: Container(
//                 height: 32.0,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: prBackground(),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(32.0),
//                     topRight: Radius.circular(32.0),
//                   ),
//                 ),
//                 child: Container(
//                   width: 40,
//                   height: 5,
//                   decoration: BoxDecoration(
//                       color: const Color(0xff666666).withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(2.5)),
//                 ),
//               ),
//             ),
//             leadingWidth: 80.0,
//             leading: InkWell(
//               onTap: (){
//                 Get.back();
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(left: 24.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(56.0),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
//                     child: Container(
//                       height: 56.0,
//                       width: 56.0,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.2),
//                       ),
//                       child: const Icon(Icons.arrow_back_ios_new_outlined),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),