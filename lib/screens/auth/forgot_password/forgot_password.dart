import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'layouts/standard_screen.dart';
import 'layouts/narrow_screen.dart';
import 'layouts/tablet_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = '/forgot_password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Құпия сөзді ұмыттыңыз ба?'),
      ),
      body: SafeArea(
        child: Responsive(
          smallMobile: NarrowScreen(
            emailController: emailController,
          ),
          mobile: StandardScreen(
            emailController: emailController,
          ),
          tablet: TabletScreen(
            emailController: emailController,
          ),
        ),
      ),
    );
  }
}
