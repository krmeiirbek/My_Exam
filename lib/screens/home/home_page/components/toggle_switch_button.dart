import 'package:flutter/material.dart';

class ToggleSwitchButton extends StatelessWidget {
  const ToggleSwitchButton({Key? key, required this.text, required this.color, required this.isSelected, required this.onTap}) : super(key: key);
  final String text;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? color.withOpacity(0.2) : Colors.transparent,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
