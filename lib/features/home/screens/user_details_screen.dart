import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/common/loader.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/home/services/user/user_services.dart';
import 'package:thriftedbookstore/features/home/widget/single_product_ord.dart';
import 'package:thriftedbookstore/features/home/widget/user_address_widget.dart';
import 'package:thriftedbookstore/features/order_details/screen/orders_details_screen.dart';
import 'package:thriftedbookstore/features/seller/widgets/logut_button.dart';
import 'package:thriftedbookstore/models/order.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class UserAddressLogScreen extends StatefulWidget {
  const UserAddressLogScreen({super.key});

  @override
  State<UserAddressLogScreen> createState() => _UserAddressLogScreenState();
}

class _UserAddressLogScreenState extends State<UserAddressLogScreen> {
  String currentAddress = "My Address";
  final UserServices userServices = UserServices();
  List<Order>? orders;
  void showModalAddressScreen() {
    showModalBottomSheet(
        backgroundColor: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(41)),
        context: context,
        builder: ((context) => const UserAddressWidget()));
  }

  @override
  void initState() {
    super.initState();
    fetchMyOrders();
  }

  void fetchMyOrders() async {
    orders = await userServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    final address = userProvider.user.address;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: commonAppBar("Reader's", "Account", size),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 225, 247, 215),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                      offset: Offset(1, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/app_bar.png",
                            height: size.height * 0.07),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: RichText(
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            text: const TextSpan(
                              text: "Account",
                              children: [
                                TextSpan(
                                    text: " Logs",
                                    style: TextStyle(color: primaryColor))
                              ],
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 27,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.person,
                          color: primaryColor.withOpacity(0.7)),
                      title: Text(
                        userProvider.user.name.toUpperCase(),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email,
                          color: primaryColor.withOpacity(0.7)),
                      title: Text(userProvider.user.email),
                    ),
                    ListTile(
                      leading: Icon(Icons.fingerprint,
                          color: primaryColor.withOpacity(0.7)),
                      title: Text("@${userProvider.user.id.hashCode}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.verified_rounded,
                          color: primaryColor.withOpacity(0.7)),
                      title: Text(userProvider.user.type),
                    ),
                    ListTile(
                      leading: Icon(Icons.store,
                          color: primaryColor.withOpacity(0.7)),
                      title: Text(address.isEmpty
                          ? "No Delivery Address Provided"
                          : userProvider.user.address),
                      trailing: IconButton(
                          onPressed: () {
                            showModalAddressScreen();
                          },
                          icon: Icon(
                            Icons.location_on,
                            color: primaryColor.withOpacity(0.7),
                          )),
                    ),
                  ],
                ),
              ),
              orders == null
                  ? const Loader()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: const Text(
                                'Your Orders',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                right: 15,
                              ),
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // display orders
                        Container(
                          height: 170,
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 20,
                            right: 0,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: orders!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      OrderDetailScreen.routeName,
                                      arguments: orders![index],
                                    );
                                  },
                                  child: SingleProductOrd(
                                      image: orders![index]
                                          .products[0]
                                          .images[0]));
                              // child: Text(orders![index].products.toString()),
                              // );
                            },
                          ),
                        ),
                        LogoutButton(onPressed: () {
                          userServices.logOut(context);
                        }),
                      ],
                    )
            ],
          ),
        ));
  }
}
