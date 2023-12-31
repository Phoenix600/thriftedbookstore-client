import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/widgets/shop_address_widget.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';

class SellerLogScreen extends StatefulWidget {
  const SellerLogScreen({super.key});

  @override
  State<SellerLogScreen> createState() => _SellerLogScreenState();
}

class _SellerLogScreenState extends State<SellerLogScreen> {
  String currentAddress = "My Address";

  void showModalAddressScreen() {
    showModalBottomSheet(
        backgroundColor: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(41)),
        context: context,
        builder: ((context) => const ShopAddressWidget()));
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Please Keep Your Location On");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location Permission Is Denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Permission Is Denied Forever");
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentAddress =
            "${place.subLocality},${place.street},${place.locality}, ${place.postalCode},${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: commonAppBar("Seller", "Account", size),
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
                      title: Text(userProvider.user.address.isEmpty
                          ? "No Shop Address Provided"
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
              Text(currentAddress),
              ElevatedButton(
                  onPressed: _determinePosition, child: const Text("Locate Me"))
            ],
          ),
        ));
  }
}
