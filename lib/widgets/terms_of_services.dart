import 'package:flutter/material.dart';

Widget termsOfServices({required double fSize}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: 'Тіркелгіні жасау арқылы сіз бізбен келісесіз',
      style: TextStyle(
        color: const Color(0xffC3C3C3),
        fontSize: fSize,
      ),
      children: const [
        TextSpan(
          text: '\nҚызмет көрсету шарттары',
          style: TextStyle(
            color: Color(0xff3C8DEF),
          ),
        ),
      ],
    ),
  );
}
