import '../../Res/app_images.dart';
import '../../Res/app_strings.dart';

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