import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class AuthScreenUser extends StatelessWidget {
  const AuthScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: const TextSpan(
                  text: "Reader's",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 21,
                  ),
                  children: [
            TextSpan(
                text: " Account",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                )),
          ]))),
    );
  }
}
