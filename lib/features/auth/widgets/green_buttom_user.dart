import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class GreenButtonUser extends StatelessWidget {
  const GreenButtonUser({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: text == "Seller"
            ? ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                surfaceTintColor: primaryColor,
                foregroundColor: backgroundColor,
                side: const BorderSide(
                  color: primaryColor,
                  width: 2,
                ))
            : ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                side: const BorderSide(color: Colors.transparent),
                backgroundColor: primaryColor,
                surfaceTintColor: backgroundColor,
                foregroundColor: backgroundColor,
                elevation: 1,
              ),
        onPressed: onTap,
        child: Text(
          text,
          style: text == "Seller"
              ? const TextStyle(color: primaryColor, fontSize: 21)
              : const TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}
