import 'package:flutter/material.dart';

import '../../global.dart';

class Responsive extends StatelessWidget {
  final Widget smallMobile;
  final Widget mobile;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.smallMobile,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Global.isTablet()) {
      return tablet;
    } else if (Global.isMobile()) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}
