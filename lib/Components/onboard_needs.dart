import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Res/app_strings.dart';

class DoIndicator extends StatelessWidget {
  const DoIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // Indicator Shape
    return InkWell(
      onTap: () {
        
      },
      child: AnimatedContainer(
        height: 10,
        duration: const Duration(milliseconds: 300),
        width: isActive ? 30 : 10,
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimaryColor : const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description, number;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });
}

final List<Onboard> onboardingData = [
  // Index 0
  Onboard(
    image: AppImages.kOnboard1,
    number: "1 of 3",
    title: AppStrings.kOnboardingTitle1,
    description: AppStrings.kOnboardingDescription1,
  ),
  // Index 1
  Onboard(
    image: AppImages.kOnboard2,
    number: "2 of 3",
    title: AppStrings.kOnboardingTitle2,
    description:
        AppStrings.kOnboardingDescription2,
  ),
  // Index 2
  Onboard(
    image: AppImages.kOnboard3,
    number: "3 of 3",
    title: AppStrings.kOnboardingTitle3,
    description:
        AppStrings.kOnboardingDescription3,
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });
  final String image, title, description, number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // for Images
        Center(
          child: Image.asset(
            image,
            width: 360,
            height: 375,
          ),
        ),
        // for PageNumbers
        Container(
          margin: const EdgeInsets.fromLTRB(24, 10, 0, 0),
          width: 53,
          height: 13,
          decoration: const BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(27.5))),
          child: Center(
              child: Text(
            number,
            style: const TextStyle(
              fontFamily: "Ubuntu",
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
          //for Titles
          child: SizedBox(
            width: 342,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
          //for Descriptions
          child: SizedBox(
            width: 248,
            child: Text(
              description,
              style: const TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 15,
                color: Color(0xff9F9F9F),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
