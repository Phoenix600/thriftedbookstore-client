import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/loader.dart';
import 'package:thriftedbookstore/common/widgets/single_product.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/screens/add_product_screen.dart';
import 'package:thriftedbookstore/features/seller/services/seller_services.dart';
import 'package:thriftedbookstore/models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final SellerServices sellerServices = SellerServices();

  void fetchAllProducts() async {
    products = await sellerServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) async {
    sellerServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
        });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  void didUpdateWidget(covariant PostScreen oldWidget) {
    fetchAllProducts();
    super.didUpdateWidget(oldWidget);
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.09),
        child: AppBar(
          surfaceTintColor: primaryColor,
          toolbarHeight: 140,
          backgroundColor: backgroundColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/app_bar.png",
                    height: size.height * 0.06,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Post",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: textColor),
                        children: [
                          TextSpan(
                              text: " Books",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor))
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return Column(
                      children: [
                        SingleProduct(
                          product: productData,
                          deleteProduct: () {
                            deleteProduct(productData, index);
                          },
                        ),
                      ],
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        backgroundColor: secondaryBackground,
        splashColor: primaryColor.withOpacity(0.13),
        foregroundColor: textColor,
        elevation: 3,
        tooltip: "Add the book",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
