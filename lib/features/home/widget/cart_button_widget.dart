import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class CartButtonIcon extends StatelessWidget {
  const CartButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
          border: Border.all(color: secondaryBackground, width: 1.4),
          borderRadius: BorderRadius.circular(44)),
      child: Badge(
        label: const Text("3"),
        backgroundColor: primaryColor,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
            )),
      ),
    );
  }
}
