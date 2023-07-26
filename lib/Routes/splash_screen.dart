import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_wise_app/Routes/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
// Named Route
  static String id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF191919),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Pic
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(123, 253, 223, 0.1), //color of shadow
                    spreadRadius: 45, //spread radius
                    blurRadius: 40, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(55),
                ),
              ),
              child: Image.asset(
                "assets/images/logo.png",
                height: 218,
                width: 210,
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            // APP Name
            const SizedBox(
              width: 300,
              height: 66,
              child: Text(
                "Sports Wise",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "logoFont",
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            // Slogan
            const SizedBox(
              width: 332,
              height: 30,
              child: Text(
                "Unlock the Power of Sports Data",
                style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(123, 253, 223, 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            //for IOS
            if (Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 20,
              )
            //for Android
            else
              const CircularProgressIndicator(
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
