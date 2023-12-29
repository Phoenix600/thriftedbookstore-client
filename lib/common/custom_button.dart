import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
  });
  final void Function() onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color == null
              ? Colors.white
              : color == null
                  ? Colors.black
                  : Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
