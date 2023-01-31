import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/standard_screen.dart';
import 'layouts/tablet_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
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
            verifyPasswordController: verifyPasswordController,
          ),
          mobile: StandardScreen(
            emailController: emailController,
            passwordController: passwordController,
            verifyPasswordController: verifyPasswordController,
          ),
          tablet: TabletScreen(
            emailController: emailController,
            passwordController: passwordController,
            verifyPasswordController: verifyPasswordController,
          ),
        ),
      ),
    );
  }
}
