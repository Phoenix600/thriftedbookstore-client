import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/home/widget/cart_button_widget.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 60),
        Row(
          children: [
            Text(
              "Discover",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Spacer(),
            CartButtonIcon(),
          ],
        ),
        SizedBox(height: 10),
        Text("Hello"),
      ],
    );
  }
}
