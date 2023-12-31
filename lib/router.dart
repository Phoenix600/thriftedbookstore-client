import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/tabs.dart';
import 'package:thriftedbookstore/features/auth/screens/auth_screen_01.dart';
import 'package:thriftedbookstore/features/home/screens/home_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/add_product_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/seller_screen.dart';

Route<MaterialPageRoute> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return const HomeScreen();
          });
    case TabsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return const TabsScreen();
          });
    case SellerScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const SellerScreen());
    case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const AddProduct());
    case AuthScreenUserOrSerller.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const AuthScreenUserOrSerller());
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
