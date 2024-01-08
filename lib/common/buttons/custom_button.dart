import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onTap, required this.text, this.color});

  final void Function() onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: color == null
              ? const Color.fromARGB(255, 220, 250, 221)
              : primaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              color: color == primaryColor ? Colors.white : Colors.black,
              fontSize: 18),
        ),
      ),
    );
  }
}
