import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/tabs.dart';
import 'package:thriftedbookstore/features/address/screen/address_screen.dart';
import 'package:thriftedbookstore/features/auth/screens/auth_screen_01.dart';
import 'package:thriftedbookstore/features/home/screens/category_deals_screen.dart';
import 'package:thriftedbookstore/features/home/screens/home_screen.dart';
import 'package:thriftedbookstore/features/order_details/screen/orders_details_screen.dart';
import 'package:thriftedbookstore/features/product_details/screens/product_details_screen.dart';
import 'package:thriftedbookstore/features/search/screen/search_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/add_product_screen.dart';
import 'package:thriftedbookstore/features/seller/screens/seller_screen.dart';
import 'package:thriftedbookstore/models/order.dart';
import 'package:thriftedbookstore/models/product.dart';

Route<MaterialPageRoute> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // Navigate to Home Screen
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return const HomeScreen();
          });
    // TabsScreen For Reader's Account
    case TabsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return const TabsScreen();
          });
    // Seller's TabsScreen
    case SellerScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const SellerScreen());
    // Add Product Screen For Seller
    case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const AddProduct());
    // Login AUTH Screen for User And Seller
    case AuthScreenUserOrSerller.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const AuthScreenUserOrSerller());
    // Navigates To The CategoryDeals Screen
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    // Navigate to the Single Product Detail Screen
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product));
    // Navigate to the Search Product Screen
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => SearchScreen(searchQuery: searchQuery),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => AddressScreen(
                totalAmount: totalAmount,
              ));
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
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
