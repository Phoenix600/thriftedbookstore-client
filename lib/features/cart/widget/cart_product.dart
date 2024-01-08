import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/cart/services/cart_services.dart';
import 'package:thriftedbookstore/models/product.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key, required this.index});
  final int index;

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    cartServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 21,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        '$rupees ${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text('Eligible for FREE Shipping'),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      color: secondaryBackground,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              decreaseQuantity(product);
                            },
                            child: Container(
                              width: 35,
                              height: 32,
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(color: backgroundColor),
                              )),
                          InkWell(
                            onTap: () {
                              increaseQuantity(product);
                            },
                            child: Container(
                              width: 35,
                              height: 32,
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                size: 18,
                                color: primaryColor,
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
