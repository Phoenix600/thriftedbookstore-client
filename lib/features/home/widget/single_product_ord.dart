import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleProductOrd extends StatelessWidget {
  const SingleProductOrd({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(10),
        // child: Image.network(
        //   image,
        //   fit: BoxFit.fitHeight,
        //   width: 180,
        // ),
        child: FadeInImage(
          fit: BoxFit.fitHeight,
          width: 180,
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(image),
        ),
      ),
    );
  }
}
