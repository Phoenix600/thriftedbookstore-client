import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thriftedbookstore/common/custom_text_field.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/auth/widgets/green_buttom_user.dart';

class ShopAddressWidget extends StatefulWidget {
  const ShopAddressWidget({super.key});

  @override
  State<ShopAddressWidget> createState() => _ShopAddressWidgetState();
}

class _ShopAddressWidgetState extends State<ShopAddressWidget> {
  final TextEditingController _shopName = TextEditingController();
  String currentAddress = "";

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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: const BoxDecoration(color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/app_bar.png",
                    height: size.height * 0.07,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/seller_location.png",
              height: size.height * 0.3,
              width: double.infinity,
            ),
            CustomTextField(controller: _shopName, hintText: "Shop Name"),
            Text(currentAddress.isEmpty
                ? "No Addresss Detected"
                : currentAddress),
            IconButton(
                onPressed: _determinePosition,
                icon: const Icon(Icons.location_on)),
            GreenButtonUser(text: "Save Address", onTap: () {})
          ],
        ),
      ),
    );
  }
}
