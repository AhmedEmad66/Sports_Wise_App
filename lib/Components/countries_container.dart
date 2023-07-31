import 'package:flutter/material.dart';

import '../Data/Models/available_countries_model/result.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class CountriesContainer extends StatelessWidget {
  const CountriesContainer({
    super.key,
    required this.ourCountries,
    required this.index,
  });

  final List<Result> ourCountries;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.kMyDarkGrey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            ourCountries[index].countryLogo ?? AppImages.kImageNotFound,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          ourCountries[index].countryName ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: AppColors.kMyDarkGrey.withOpacity(0.5),
            fontSize: 15,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
            color: AppColors.kMyWhite,
          ),
        ),
      ),
    );
  }
}
