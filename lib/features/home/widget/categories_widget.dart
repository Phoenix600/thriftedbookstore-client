import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
