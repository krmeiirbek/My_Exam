import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_exam/screens/auth/sign_up.dart';

import '../home/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 34,
                    color: Color(0xff3D3D74),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Sign in to continue',
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
                SizedBox(height: height * 0.043),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Home()));
                  },
                  child: Ink(
                    height: height * 0.06,
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
                  children: const [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 0, top: 6),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.052),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        '--- Or ---',
                        style: TextStyle(letterSpacing: 0),
                      ),
                      const SizedBox(height: 17),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google.svg',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 11),
                          SvgPicture.asset(
                            'assets/icons/facebook.svg',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 11),
                          SvgPicture.asset(
                            'assets/icons/twitter.svg',
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          color: Color(0xffC3C3C3),
                          fontSize: 13,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SignUp()),
                          );
                        },
                        child: const Text(
                          'Create Now',
                          style: TextStyle(
                            color: Color(0xff3C8DEF),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
