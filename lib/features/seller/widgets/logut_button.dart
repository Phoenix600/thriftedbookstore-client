import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              surfaceTintColor: backgroundColor,
              foregroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          icon: const Icon(Icons.outbond, color: backgroundColor),
          label: const Text(
            "Logout",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
    );
  }
}
