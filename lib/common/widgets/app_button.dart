import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.style,
    required this.background,
    this.boxShadow,
    required this.size,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final TextStyle style;
  final Color background;
  final List<BoxShadow>? boxShadow;
  final Size size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(size.height / 2)),
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
