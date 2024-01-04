import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/features/home/services/home_services.dart';
import 'package:thriftedbookstore/features/home/widget/categories_widget.dart';
import 'package:thriftedbookstore/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: commonAppBar("Book", "Categories", size), body: const CategoriesWidget());
  }
}
