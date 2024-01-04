import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/home/services/home_services.dart';
import 'package:thriftedbookstore/models/product.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return product == null
        ? Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: secondaryBackground,
                borderRadius: BorderRadius.circular(10)),
            child: const Text("No Deal of the day is found"),
          )
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.celebration,
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
                                TextSpan(text: "Day")
                              ])),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: BoxDecoration(
                          color: secondaryBackground,
                          gradient: LinearGradient(
                            colors: [
                              primaryColor.withOpacity(0.19),
                              primaryColor.withOpacity(0.01)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                product!.name,
                                style: const TextStyle(fontSize: 21),
                              )),
                          Image.network(
                            height: size.height * 0.23,
                            fit: BoxFit.fitHeight,
                            product!.images[0],
                          ),
                          Row(
                            children: [
                              Text(
                                "$rupees ${product!.price}",
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
