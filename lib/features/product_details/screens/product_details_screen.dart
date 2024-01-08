import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/common/custom_button.dart';
import 'package:thriftedbookstore/common/stars.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/auth/widgets/green_buttom_user.dart';
import 'package:thriftedbookstore/features/product_details/services/product_details_services.dart';
import 'package:thriftedbookstore/models/product.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  static const String routeName = "/product-details";
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar("Thrifted ", "Books", size),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(rating: avgRating),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            CarouselSlider(
                items: [
                  for (final imageUrl in widget.product.images)
                    Builder(
                        builder: ((context) => Image.network(
                              imageUrl,
                              height: 200,
                              fit: BoxFit.contain,
                            )))
                ],
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 300,
                )),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: RichText(
                  text: TextSpan(
                      text: "Deal Price: ",
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                    TextSpan(
                        text: "${widget.product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor)),
                  ])),
            ),

            /// #TODO: Add the Buy Now Functionality
            Padding(
              padding: const EdgeInsets.all(10),
              child: GreenButtonUser(text: "Buy Now", onTap: () {}),
            ),
            const SizedBox(height: 10),
            CustomButton(onTap: addToCart, text: "Add To Cart"),
            const SizedBox(height: 10),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Rate The Product",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            RatingBar.builder(
                initialRating: myRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(vertical: 4),
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                onRatingUpdate: (rating) {
                  productDetailsServices.rateProduct(
                      context: context,
                      product: widget.product,
                      rating: rating);
                })
          ],
        ),
      ),
    );
  }
}
