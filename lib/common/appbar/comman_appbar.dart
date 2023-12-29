import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

PreferredSize commonAppBar(String text1, String text2, Size size) {
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.09),
    child: AppBar(
      surfaceTintColor: primaryColor,
      toolbarHeight: 140,
      backgroundColor: backgroundColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                    text: text1,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                    children: [
                      TextSpan(
                          text: " $text2",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, color: primaryColor))
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}
