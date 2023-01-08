import 'package:flutter/material.dart';

import 'layouts/standard_screen.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/tablet_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          if (constraint.maxWidth > 600) {
            if(constraint.maxHeight > 450) {
              return const TabletScreen();
            }else {
              return const SingleChildScrollView(child: TabletScreen());
            }
          } else if (constraint.maxWidth > 400) {
            if (constraint.maxHeight > 650) {
              return const StandardScreen();
            } else {
              return const SingleChildScrollView(child: StandardScreen());
            }
          } else {
            if (constraint.maxHeight > 500) {
              return const NarrowScreen();
            } else {
              return const SingleChildScrollView(child: NarrowScreen());
            }
          }
        }),
      ),
    );
  }
}
