import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/search_field.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.20),
        child: AppBar(
          toolbarHeight: 140,
          backgroundColor: backgroundColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Discover"),
                  const Spacer(),
                  Badge(
                    offset: const Offset(1, 2),
                    label: const Text("3"),
                    backgroundColor: primaryColor,
                    child: IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SearchField(),
              // const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
