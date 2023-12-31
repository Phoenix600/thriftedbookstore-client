import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: primaryColor,
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
      ),
    );
  }
}
