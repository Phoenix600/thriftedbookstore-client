import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/common/loader.dart';

import 'package:thriftedbookstore/features/home/services/home_services.dart';
import 'package:thriftedbookstore/features/home/widget/single_display_product.dart';
import 'package:thriftedbookstore/features/product_details/screens/product_details_screen.dart';
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
      appBar: commonAppBar("Thrifted", widget.category, size),
      body: productList == null
          ? const Loader()
          : Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  child: Text(
                    "Keep Shopping For ${widget.category}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: productList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final product = productList![index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailsScreen.routeName,
                                arguments: product);
                          },
                          // child: Column(
                          //   children: <Widget>[
                          //     SizedBox(
                          //       height: 130,
                          //       child: DecoratedBox(
                          //         decoration: BoxDecoration(
                          //             color: secondaryBackground,
                          //             borderRadius: BorderRadius.circular(10)),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(10),
                          //           child: Image.network(product.images[0]),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          child: SingleDisplayProduct(productData: product),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
