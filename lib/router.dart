import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/tabs.dart';
import 'package:thriftedbookstore/features/home/screens/home_screen.dart';

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
