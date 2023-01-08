import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_exam/configs/themes/ui_parameters.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = UIParameters.isDarkMode();
  bool _reminder = false;
  bool _newExam = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xff3C8DEF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/flashlight.svg',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Dark modes',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: _darkMode,
                      onChanged: (bool value) {
                        setState(() {
                          _darkMode = !_darkMode;
                          _darkMode
                              ? Get.changeTheme(ThemeData.dark())
                              : Get.changeTheme(ThemeData.light());
                        });
                      },
                      activeColor: const Color(0xff599BF0),
                      thumbColor: _darkMode
                          ? const Color(0xff4785EB)
                          : const Color(0xff999999),
                      trackColor: const Color(0xffC3C3C3),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/reminder.svg',
                      height: 25,
                      width: 21,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Study reminder',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: _reminder,
                      onChanged: (bool value) {
                        setState(() {
                          _reminder = !_reminder;
                        });
                      },
                      activeColor: const Color(0xff599BF0),
                      thumbColor: _reminder
                          ? const Color(0xff4785EB)
                          : const Color(0xff999999),
                      trackColor: const Color(0xffC3C3C3),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/new.svg',
                      height: 23,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'New exam',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: _newExam,
                      onChanged: (bool value) {
                        setState(() {
                          _newExam = !_newExam;
                        });
                      },
                      activeColor: const Color(0xff599BF0),
                      thumbColor: _newExam
                          ? const Color(0xff4785EB)
                          : const Color(0xff999999),
                      trackColor: const Color(0xffC3C3C3),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/faq.svg',
                      height: 25,
                      width: 23,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Help center',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shield.svg',
                      height: 25,
                      width: 21,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Privacy & Terms',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 38,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/contactus.svg',
                      height: 21,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D74),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xffC3C3C3),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 70),
              child: Divider(
                color: const Color(0xff707070).withOpacity(0.3),
                thickness: 2,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {},
                child: Ink(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffE3F0FF),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff589AEF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
