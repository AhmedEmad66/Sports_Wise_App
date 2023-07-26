import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_wise_app/Routes/onboarding_screen.dart';

import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../Res/app_strings.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
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
      backgroundColor: AppColors.kBackGroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AppImages.kSplashBG,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Back Glow
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        Color.fromRGBO(123, 253, 223, 0.1), //color of shadow
                    spreadRadius: 45, //spread radius
                    blurRadius: 40, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(70),
                ),
              ),
              // Logo Pic
              child: Image.asset(
                AppImages.kAppLogo,
                color: AppColors.kPrimaryColor,
                height: 218,
                width: 210,
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            // APP Name
            const Text(
              AppStrings.kAppName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "logoFont",
                fontSize: 40,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Slogan
            const Text(
              AppStrings.kAppSlogan,
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.kPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
