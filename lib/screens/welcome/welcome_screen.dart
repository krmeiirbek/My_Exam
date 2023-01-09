import 'package:flutter/material.dart';

import 'layouts/narrow_screen.dart';
import 'layouts/standard_screen.dart';
import 'layouts/tablet_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          if (constraint.maxWidth > 600) {
            if (constraint.maxHeight > 900) {
              return const TabletScreen();
            } else {
              return const SingleChildScrollView(child: TabletScreen());
            }
          } else if (constraint.maxWidth > 385) {
            if (constraint.maxHeight > 700) {
              return const StandardScreen();
            } else {
              return const SingleChildScrollView(child: StandardScreen());
            }
          } else {
            if (constraint.maxHeight > 550) {
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
