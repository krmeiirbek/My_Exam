import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/welcome.png'),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'We currently have over 740 exam waiting for you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff3D3D74),
                  ),
                ),
              ),
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    height: 55,
                    width: 317,
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
              const SizedBox(height: 23),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff999999),
                ),
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    height: 55,
                    width: 317,
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
            ],
          ),
        ),
      ),
    );
  }
}
