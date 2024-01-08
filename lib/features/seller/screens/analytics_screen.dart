import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/loader.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/model/sales.dart';
import 'package:thriftedbookstore/features/seller/services/seller_services.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int? totalSales;
  List<Sales>? earnings;
  SellerServices sellerServices = SellerServices();

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await sellerServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
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
                        text: "Analytics",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        body: earnings == null || totalSales == null
            ? const Loader()
            : Column(
                children: [
                  const Text('Total Sales'),
                  Text("$totalSales"),
                ],
              ));
  }
}
