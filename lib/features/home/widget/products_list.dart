import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/loader.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/home/services/home_services.dart';
import 'package:thriftedbookstore/features/home/widget/single_display_product.dart';
import 'package:thriftedbookstore/models/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  HomeServices homeServices = HomeServices();
  List<Product>? products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    products = await homeServices.fetchAllProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.book_rounded,
                    color: primaryColor.withOpacity(0.7),
                  ),
                  const SizedBox(width: 10),
                  RichText(
                      text: const TextSpan(
                          text: "Book ",
                          style: TextStyle(
                              fontSize: 19,
                              color: primaryColor,
                              fontWeight: FontWeight.w700),
                          children: <TextSpan>[
                        TextSpan(
                            text: "Of The ",
                            style: TextStyle(color: textColor)),
                        TextSpan(text: "Day"),
                      ])),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products!.length % 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final productData = products![index];
                        return SingleDisplayProduct(productData: productData);
                      }),
                ],
              ),
            ],
          );
  }
}
