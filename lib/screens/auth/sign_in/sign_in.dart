import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'layouts/standard_screen.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/tablet_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String routeName = '/sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          smallMobile: NarrowScreen(
            emailController: emailController,
            passwordController: passwordController,
          ),
          mobile: StandardScreen(
            emailController: emailController,
            passwordController: passwordController,
          ),
          tablet: TabletScreen(
            emailController: emailController,
            passwordController: passwordController,
          ),
        ),
      ),
    );
  }
}
