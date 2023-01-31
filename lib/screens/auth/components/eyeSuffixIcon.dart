import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget eyeSuffixIcon({required VoidCallback onTap, required Color color}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SvgPicture.asset(
        'assets/icons/eye.svg',
        color: color,
      ),
    ),
  );
}