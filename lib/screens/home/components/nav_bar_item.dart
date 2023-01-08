import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget navBarItem({
  required int idx,
  required int currentIdx,
  required VoidCallback onTap,
  required String title,
  required String svg,
  required double iconSize,
  required double fontSize,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          svg,
          height: iconSize,
          color: currentIdx == idx ? Colors.lightBlue : const Color(0xff666666),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color:
            currentIdx == idx ? Colors.lightBlue : const Color(0xff666666),
            fontSize: fontSize,
          ),
        ),
      ],
    ),
  );
}