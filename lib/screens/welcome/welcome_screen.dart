import 'package:flutter/material.dart';
import 'package:my_exam/screens/auth/sign_in.dart';
import 'package:my_exam/screens/auth/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height; // 932
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.032),
              Image.asset('assets/images/welcome.png'),
              SizedBox(height: height * 0.022),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.064),
                child: const Text(
                  'We currently have over 740 exam waiting for you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff3D3D74),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.032),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const SignIn()));
                  },
                  child: Ink(
                    height: height * 0.059,
                    width: height * 0.34,
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
              ),
              SizedBox(height: height * 0.025),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff999999),
                ),
              ),
              SizedBox(height: height * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.032),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const SignUp()));
                  },
                  child: Ink(
                    height: height * 0.059,
                    width: height * 0.34,
                    decoration: const BoxDecoration(
                      color: Color(0xffE3F0FF),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff589AEF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By creating an account, you are agreeing to our',
                  style: TextStyle(
                    color: Color(0xffC3C3C3),
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: '\nTerms of Service',
                      style: TextStyle(
                        color: Color(0xff3C8DEF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.016),
            ],
          ),
        ),
      ),
    );
  }
}
