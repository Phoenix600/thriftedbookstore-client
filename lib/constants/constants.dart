import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xffffffff);
const Color secondaryBackground = Color(0xfff1f1f1);
const Color primaryColor = Color(0xff48d861);
const Color textColor = Color(0xff2a2a2a);
String uri = 'http://192.168.0.102:3000';
// String uri = "https://thrifted-server.onrender.com";
List<String> bookCategories = [
  "Academics",
  "Comic",
  "Fiction",
  "Novel",
  "Collectibles"
];

class GlobalTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: const AppBarTheme(
      surfaceTintColor: primaryColor,
    ),

    // Bottom Bar Theme
    navigationBarTheme: const NavigationBarThemeData().copyWith(
      surfaceTintColor: primaryColor,
      indicatorColor: const Color.fromARGB(255, 230, 248, 181),
    ),
  );
}
