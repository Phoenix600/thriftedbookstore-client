import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/search_field.dart';
import 'package:thriftedbookstore/common/user_app_bar.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/home/widget/carousel_images.dart';
import 'package:thriftedbookstore/features/home/widget/deal_of_day.dart';
import 'package:thriftedbookstore/features/home/widget/products_list.dart';
import 'package:thriftedbookstore/features/search/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10), // 0.09
        child: AppBar(
          flexibleSpace: const SizedBox(height: 100),
          backgroundColor: backgroundColor,
          title: const UserAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(height: 15),
              CarouselSliderWidget(),
              const SizedBox(height: 15),
              const DealOfTheDay(),
              const SizedBox(height: 10),
              const ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
