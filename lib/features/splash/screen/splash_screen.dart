import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: size.width * 0.5,
          height: size.height * 0.5,
        ),
      ),
    );
  }
}
