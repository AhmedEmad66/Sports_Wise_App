import 'package:flutter/material.dart';

import '../../Res/app_images.dart';
import '../../Res/app_strings.dart';
import '../../generated/l10n.dart';

class Onboard {
  final String image, title, description, number;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });
}

List<Onboard> onboardingData(BuildContext context) {
  return [
    // Index 0
    Onboard(
      image: AppImages.kOnboard1,
      number: S.of(context).onboardingNumber1,
      title: S.of(context).onboardingTitle1,
      description: S.of(context).onboardingDescription1,
    ),
    // Index 1
    Onboard(
      image: AppImages.kOnboard2,
      number: S.of(context).onboardingNumber2,
      title: S.of(context).onboardingTitle2,
      description: S.of(context).onboardingDescription2,
    ),
    // Index 2
    Onboard(
      image: AppImages.kOnboard3,
      number: S.of(context).onboardingNumber3,
      title: S.of(context).onboardingTitle3,
      description: S.of(context).onboardingDescription3,
    ),
  ];
}
