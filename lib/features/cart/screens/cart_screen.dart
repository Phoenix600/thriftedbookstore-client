import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/common/buttons/custom_button.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/address/screen/address_screen.dart';
import 'package:thriftedbookstore/features/cart/widget/cart_product.dart';
import 'package:thriftedbookstore/features/cart/widget/cart_subtotal.dart';
import 'package:thriftedbookstore/features/home/widget/address_box.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToAddress(int sum) {
    Navigator.pushNamed(context, AddressScreen.routeName,
        arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    Size size = MediaQuery.of(context).size;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Scaffold(
      appBar: commonAppBar("Thrifted", "Cart", size),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            const CartSubtotal(),
            CustomButton(
              onTap: () {
                navigateToAddress(sum);
              },
              text: "Proceed to Buy (${user.cart.length} items)",
              color: primaryColor,
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: user.cart.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartProduct(index: index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
