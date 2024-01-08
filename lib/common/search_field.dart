import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/search/screen/search_screen.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondaryBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        onFieldSubmitted: navigateToSearchScreen,
        controller: _controller,
        decoration: InputDecoration(
            hintText: "Search Thrifted Books",
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                navigateToSearchScreen(_controller.text);
              },
              color: textColor,
              icon: const Icon(Icons.search),
            )),
      ),
    );
  }
}
