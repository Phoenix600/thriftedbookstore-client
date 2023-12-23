import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({super.key});

  final list = [
    Image.asset("assets/images/Cover-2.png", height: 300, fit: BoxFit.cover),
    Image.asset("assets/images/Cover-1.png", height: 300, fit: BoxFit.cover),
    Image.asset("assets/images/Cover-3.png", height: 300, fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
              items: [
                for (var i = 0; i < list.length; i++)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15), // The old value of circular radius was 10
                    child: list[i],
                  ),
              ],
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                viewportFraction: 1,
                clipBehavior: Clip.antiAlias,
                disableCenter: true,
              )),
        ),
      ],
    );
  }
}
