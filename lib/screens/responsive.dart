import 'package:flutter/material.dart';

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

  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 385;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 385 &&
      MediaQuery.of(context).size.width < 576;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 576;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > 576) {
      return tablet;
    } else if (size.width > 385) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}
