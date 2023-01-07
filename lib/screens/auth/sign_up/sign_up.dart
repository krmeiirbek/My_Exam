import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exam/screens/auth/sign_in/sign_in.dart';
import 'package:my_exam/screens/home/home.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height; // 932
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height * 0.9,
            padding: EdgeInsets.symmetric(horizontal: height * 0.032),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.086,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/splash.png',
                    width: height * 0.12,
                    height: height * 0.15,
                  ),
                ),
                SizedBox(height: height * 0.043),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 34,
                    color: Color(0xff3D3D74),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Create an account to continue',
                  style: TextStyle(color: Color(0xff707070), fontSize: 13),
                ),
                SizedBox(height: height * 0.039),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                      color: Color(0xffC3C3C3),
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Verify Password',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Exam preparation level',
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xffC3C3C3),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'You can make changes in the profile',
                  style: TextStyle(
                    color: Color(0xff3C8DEF),
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: height * 0.043),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(Home.routeName);
                  },
                  child: Ink(
                    height: height * 0.059,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff4785EB),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff599BF0).withOpacity(0.4),
                          offset: const Offset(0, 15),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.016),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 0, top: 6),
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 0, top: 6),
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(SignIn.routeName);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff3D3D74),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
