import 'package:flutter/material.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/auth/screens/seller_screen/auth_screen_seller_signup.dart';
import 'package:thriftedbookstore/features/auth/screens/user_screen/auth_screen_user.dart';
import 'package:thriftedbookstore/features/auth/widgets/green_buttom_user.dart';

class AuthScreenUserOrSerller extends StatefulWidget {
  const AuthScreenUserOrSerller({super.key});
  static const String routeName = "/auth-screen";

  @override
  State<AuthScreenUserOrSerller> createState() =>
      _AuthScreenUserOrSerllerState();
}

class _AuthScreenUserOrSerllerState extends State<AuthScreenUserOrSerller> {
  void onPressed(String userType) {
    if (userType == "Reader") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const AuthScreenUser();
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const AuthScreenSellerSignup();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: Image.asset("assets/images/logo.png"),
            ),
            Image.asset(
              "assets/images/auth_choice.png",
              height: size.height * 0.4,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Text(
                  "Welcome To",
                  style: TextStyle(fontSize: 25),
                ),
                RichText(
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    softWrap: true,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Thrifted",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            color: primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " Book Store",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.01),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                    "\"where the love of reading unites both avid readers and passionate sellers\"",
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Divider(),
                ),
              ],
            ),
            // RichText(
            //   overflow: TextOverflow.clip,
            //   softWrap: true,
            //   textAlign: TextAlign.center,
            //   maxLines: 2,
            //   text: TextSpan(
            //     text: "Are you",
            //     style: Theme.of(context).textTheme.headlineMedium,
            //     children: const <TextSpan>[
            //       TextSpan(
            //           text: " Reader",
            //           style: TextStyle(
            //             color: primaryColor,
            //             fontWeight: FontWeight.bold,
            //             fontStyle: FontStyle.italic,
            //           )),
            //       TextSpan(
            //           text: " Or ",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           )),
            //       TextSpan(
            //           text: "Seller ?",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           )),
            //     ],
            //   ),
            // ),
            SizedBox(height: size.height * 0.01),
            const Text(
              "Who are you?",
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            GreenButtonUser(
                text: "Reader",
                onTap: () {
                  onPressed("Reader");
                }),
            SizedBox(height: size.height * 0.03),
            GreenButtonUser(
                text: "Seller",
                onTap: () {
                  onPressed("Seller");
                }),
          ],
        ),
      ),
    );
  }
}
