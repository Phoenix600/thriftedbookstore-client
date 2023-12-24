import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.09),
        child: AppBar(
          surfaceTintColor: primaryColor,
          toolbarHeight: 140,
          backgroundColor: backgroundColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/app_bar.png",
                    height: size.height * 0.06,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Order ",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: textColor),
                        children: [
                          TextSpan(
                              text: "Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor))
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("Orders Screen"),
      ),
    );
  }
}
