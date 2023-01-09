import 'package:flutter/material.dart';

import 'layouts/narrow_screen.dart';
import 'layouts/standard_screen.dart';
import 'layouts/tablet_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          if (constraint.maxWidth > 600) {
            return const TabletScreen();
          } else if (constraint.maxWidth > 385) {
            return const StandardScreen();
          } else {
            return const NarrowScreen();
          }
        }),
      ),
    );
  }
}
