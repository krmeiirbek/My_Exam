import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/splash.png'),
            const SizedBox(height: 29),
            Image.asset('assets/images/splash_ellipse.png'),
          ],
        ),
      ),
    );
  }
}
