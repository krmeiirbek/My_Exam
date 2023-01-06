import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.style,
    required this.background,
    this.boxShadow,
    this.height,
    this.width,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final TextStyle style;
  final Color background;
  final List<BoxShadow>? boxShadow;
  final double? height;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: height ?? 50,
        width: width ?? 300,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: boxShadow,
        ),
        child: Center(
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
