import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/langs/langs.dart';
import '../../../../common/values/values.dart';


Widget termsOfServices({required TextStyle style}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: termsOfServices0.tr,
      style: style,
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = (){},
          text: '\n${termsOfServices1.tr}',
          style: TextStyle(
            color: secondaryColor(),
          ),
        ),
      ],
    ),
  );
}
