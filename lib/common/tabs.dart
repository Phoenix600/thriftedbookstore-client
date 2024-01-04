import 'package:flutter/material.dart';
import 'package:thriftedbookstore/features/home/screens/home_screen.dart';
import 'package:thriftedbookstore/features/home/screens/user_details_screen.dart';
import 'package:thriftedbookstore/features/home/widget/categories_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const String routeName = '/actual-home';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

List<Widget> screens = [
  const HomeScreen(),
  const CategoriesWidget(),
  const Center(child: Text("Cart Screen")),
  const UserAddressLogScreen(),
];

class _TabsScreenState extends State<TabsScreen> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 700),
        selectedIndex: _page,
        onDestinationSelected: (index) {
          setState(() {
            _page = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.category_outlined), label: "Category"),
          NavigationDestination(
              icon: Badge(
                backgroundColor: Colors.green,
                label: Text("3"),
                child: Icon(Icons.shopping_bag_outlined),
              ),
              label: "Cart"),
          NavigationDestination(
              icon: Icon(Icons.person_4_outlined), label: "Account"),
        ],
      ),
    );
  }
}
