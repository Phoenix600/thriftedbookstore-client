import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xffffffff);
const Color secondaryBackground = Color(0xfff1f1f1);
const Color primaryColor = Color(0xff48d861);
const Color textColor = Color(0xff2a2a2a);
// String uri = 'http://192.168.0.101:3000';
String uri = 'https://thrifted-server.onrender.com';
List<String> bookCategories = [
  "Academics",
  "Comic",
  "Fiction",
  "Novel",
  "Collectibles"
];

String rupees = "₹";

// Category Images
const List<Map<String, String>> categoryImages = [
  {'title': "Academics", 'image': "assets/categories/Academics.png"},
  {'title': "Comic", 'image': "assets/categories/Comic.png"},
  {'title': "Fiction", 'image': "assets/categories/Fiction.png"},
  {'title': "Novel", 'image': "assets/categories/Novel.png"},
  {'title': "Collectibles", 'image': "assets/categories/Collectibles.png"},
];

class Category {
  final String title;
  final Color color;
  Category({
    required this.title,
    required this.color,
  });
}

List<Category> categories = [
  Category(title: "Academics", color: Colors.lightBlue),
  Category(title: "Comic", color: Colors.orangeAccent),
  Category(title: "Fiction", color: Colors.deepPurpleAccent),
  Category(title: "Novel", color: Colors.blueGrey),
  Category(title: "Collectibles", color: Colors.yellowAccent),
];

class GlobalTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: const AppBarTheme(
      surfaceTintColor: primaryColor,
    ),

    // Bottom Bar Theme
    navigationBarTheme: const NavigationBarThemeData().copyWith(
      surfaceTintColor: const Color.fromARGB(207, 242, 255, 211),
      indicatorColor: const Color.fromARGB(255, 157, 247, 172),
    ),
  );
}
