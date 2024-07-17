import 'package:ecommerce_intrazero/core/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // navigatorScreen();
    });
    super.initState();
  }

  navigatorScreen() {
    FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser != null) {
      context.pushReplacementNamed(homeLayout);
    } else {
      context.pushReplacementNamed(loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.kPrimaryColor,
            child: Center(
              child: Image.asset(
                'assets/images/logolandscape.png',
                color: AppColor.kBackGroundColor,
                width: 300,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -150,
            child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.sizeOf(context).width * 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
