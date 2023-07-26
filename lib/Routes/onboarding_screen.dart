import 'package:flutter/material.dart';
import 'package:sport_wise_app/Routes/home_screen.dart';

import '../Components/change_language.dart';
import '../Components/onboard_needs.dart';
import '../Res/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  // Named Route
  static String id = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const ArabicLanguage(),
            Expanded(
              // scrolling PageView for content
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                // Content
                itemBuilder: (context, index) => OnboardContent(
                  image: onboardingData[index].image,
                  title: onboardingData[index].title,
                  number: onboardingData[index].number,
                  description: onboardingData[index].description,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Indicator
                  ...List.generate(
                    onboardingData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DoIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
                  // Skip Button
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HomeScreen()));
                    },
                    child: const SizedBox(
                      width: 50,
                      height: 30,
                      child: Center(
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Ubuntu",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
