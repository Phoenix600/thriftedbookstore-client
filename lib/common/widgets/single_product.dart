import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct(
      {super.key, required this.product, required this.deleteProduct});

  final Product product;
  final void Function() deleteProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      height: 150,
      width: 180,
      decoration: BoxDecoration(
          color: secondaryBackground, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInImage(
              height: 100,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(product.images[0])),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(product.name),
                IconButton(
                    onPressed: deleteProduct, icon: const Icon(Icons.delete))
              ],
            ),
          )
        ],
      ),
    );
  }
}
