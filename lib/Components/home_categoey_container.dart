import 'package:flutter/material.dart';

import '../Data/Models/home_categories_model.dart';
import '../Res/app_colors.dart';

class HomeScreenCategoryContainer extends StatelessWidget {
  const HomeScreenCategoryContainer({
    super.key,
    required this.categories, required this.index,
  });

  final List<HomeCategoriesModel> categories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            categories[index].categoryImage,
          ),
        ),
        color: AppColors.kMyDarkGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          categories[index].categoryName,
          style: const TextStyle(
            fontFamily: "MyFont",
            color: AppColors.kMyWhite,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}