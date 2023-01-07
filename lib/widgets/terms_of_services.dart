import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/translation/tr_constants.dart';

Widget termsOfServices({required double fSize}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: termsOfServices0.tr,
      style: TextStyle(
        color: const Color(0xffC3C3C3),
        fontSize: fSize,
      ),
      children: [
        TextSpan(
          text: '\n${termsOfServices1.tr}',
          style: const TextStyle(
            color: Color(0xff3C8DEF),
          ),
        ),
      ],
    ),
  );
}
