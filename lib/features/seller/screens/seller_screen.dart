import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/screens/analytics_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/orders_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/post_screen.dart';

class SellerScreen extends StatefulWidget {
  static const String routeName = "/seller";
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  int _page = 0;
  List<Widget> screens = const [
    PostScreen(),
    AnalyticsScreen(),
    OrdersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _page = value;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 600),
        selectedIndex: _page,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.book_outlined), label: "Books"),
          NavigationDestination(
              icon: Icon(Icons.analytics_outlined), label: "Analytics"),
          NavigationDestination(
              icon: Icon(Icons.all_inbox_outlined), label: "Tracking"),
        ],
      ),
    );
  }
}
