import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/models/product.dart';

class SingleDisplayProduct extends StatelessWidget {
  const SingleDisplayProduct({super.key, required this.productData});
  final Product productData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: size.height * 0.3,
      decoration: BoxDecoration(
          color: secondaryBackground, borderRadius: BorderRadius.circular(10)),
      child: Column(
        // mainAxisSize: MainAxisSize.xmin,
        children: [
          Image.network(
            productData.images[0],
            height: 100,
            fit: BoxFit.fitHeight,
          ),
          Text(productData.name),
          Expanded(child: Text(productData.price.toString()))
        ],
      ),
    );
  }
}
