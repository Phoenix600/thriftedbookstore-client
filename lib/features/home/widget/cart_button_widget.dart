import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class CartButtonIcon extends StatelessWidget {
  const CartButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Ink(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
          border: Border.all(color: secondaryBackground, width: 1.4),
          borderRadius: BorderRadius.circular(44)),
      child: Badge(
        label: Text("$userCartLen"),
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
