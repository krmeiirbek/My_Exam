import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
                width: double.infinity,
              ),
              Center(
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 110,
                  height: 140,
                ),
              ),
              const SizedBox(height: 40),
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
              const SizedBox(height: 36),
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
              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: 55,
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
              const SizedBox(height: 15),
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
              const SizedBox(height: 48),
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
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      color: Color(0xffC3C3C3),
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Now',
                        style: TextStyle(
                          color: Color(0xff3C8DEF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
