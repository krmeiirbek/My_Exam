import 'package:flutter/material.dart';

import 'layouts/narrow_screen.dart';
import 'layouts/standard_screen.dart';
import 'layouts/tablet_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        if (constraint.maxWidth > 600) {
          return const TabletScreen();
        } else if (constraint.maxWidth > 385) {
          return const StandardScreen();
        } else {
          return const NarrowScreen();
        }
      },
    );
  }
}
