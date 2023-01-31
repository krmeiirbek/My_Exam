import 'package:flutter/material.dart';

import '../responsive.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/standard_screen.dart';
import 'layouts/tablet_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Responsive(
          smallMobile: NarrowScreen(),
          mobile: StandardScreen(),
          tablet: TabletScreen(),
        ),
      ),
    );
  }
}
