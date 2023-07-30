import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport_wise_app/Components/main_button.dart';
import 'package:sport_wise_app/Res/app_strings.dart';
import 'package:sport_wise_app/Routes/home_screen.dart';

import '../Components/change_language.dart';
import '../Components/do_indicator.dart';
import '../Components/onboard_needs.dart';
import '../Data/Models/onboarding_model.dart';
import '../Res/app_colors.dart';
import '../generated/l10n.dart';

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
  Timer? _timer;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    // Automatically slide to the next page after 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageIndex < 2) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Onboard> onboardItems = onboardingData(context);
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      // To Avoid The System Bars
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              AppStrings.kAppLanguage == "ar"
                  ? const EnglishLanguage()
                  : const ArabicLanguage(),
              Expanded(
                // scrolling PageView for content
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: onboardItems.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  // Content
                  itemBuilder: (context, index) => OnboardContent(
                    image: onboardItems[index].image,
                    title: onboardItems[index].title,
                    number: onboardItems[index].number,
                    description: onboardItems[index].description,
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
                      onboardItems.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                            onTap: () {
                              _pageController.jumpToPage(index);
                            },
                            child: DoIndicator(isActive: index == _pageIndex)),
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
                      child: MainButton(
                          text: S.of(context).skipBtn,
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          borderThickness: 1,
                          borderColor:  const [
                            AppColors.kMyLightGrey,
                            AppColors.kPrimaryColor,
                          ],
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
