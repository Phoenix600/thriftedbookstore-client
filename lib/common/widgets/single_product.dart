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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: 160,
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 19),
                ),
                IconButton(
                    onPressed: deleteProduct,
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
