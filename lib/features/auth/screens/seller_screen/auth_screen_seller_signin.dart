import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/custom_text_field.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/auth/screens/seller_screen/auth_screen_seller_signup.dart';
import 'package:thriftedbookstore/features/auth/services/seller_services/auth_seller_service.dart';
import 'package:thriftedbookstore/features/auth/widgets/green_buttom_user.dart';

class AuthScreenSellerSignin extends StatefulWidget {
  const AuthScreenSellerSignin({super.key});

  @override
  State<AuthScreenSellerSignin> createState() => _AuthScreenSellerSigninState();
}

class _AuthScreenSellerSigninState extends State<AuthScreenSellerSignin> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthSellerService authSellerService = AuthSellerService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signInUser() {
    authSellerService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: RichText(
            text: const TextSpan(
                text: "Seller's",
                style: TextStyle(
                  color: textColor,
                  fontSize: 21,
                ),
                children: [
              TextSpan(
                  text: " Account",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  )),
            ])),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/seller_login.png",
                height: 300,
                fit: BoxFit.contain,
              ),
              RichText(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Welcome ",
                        style: TextStyle(
                          fontSize: size.height * 0.030,
                          color: textColor,
                        )),
                    TextSpan(
                        text: "Seller \n",
                        style: TextStyle(
                          fontSize: size.height * 0.030,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: " To ",
                        style: TextStyle(
                          fontSize: size.height * 0.030,
                          color: textColor,
                        )),
                    TextSpan(
                        text: "Thrifted",
                        style: TextStyle(
                          fontSize: size.height * 0.030,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: " Book Store",
                        style: TextStyle(
                          fontSize: size.height * 0.030,
                          color: textColor,
                        )),
                  ])),
              SizedBox(height: size.height * 0.03),
              Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        color: secondaryBackground, // Shadow color
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset: Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05,
                    horizontal: size.height * 0.025),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      GreenButtonUser(
                        text: 'Sign Up',
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const AuthScreenSellerSignup()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Don't Have An Account",
                            style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
