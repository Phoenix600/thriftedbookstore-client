import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondaryBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
            hintText: "Search Thrifted Books",
            border: InputBorder.none,
            suffixIcon: Icon(
              color: textColor,
              Icons.search,
            )),
      ),
    );
  }
}
