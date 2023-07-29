import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_images.dart';

import '../../generated/l10n.dart';

class HomeCategoriesModel {
  final String categoryName;
  final String categoryImage;

  HomeCategoriesModel(
      {required this.categoryName, required this.categoryImage});
}

List<HomeCategoriesModel> homeCategoriesItems(BuildContext context) {
  return [
    HomeCategoriesModel(
      categoryName: S.of(context).footballCategory,
      categoryImage: AppImages.kFootball,
    ),
    HomeCategoriesModel(
      categoryName: S.of(context).basketballCategory,
      categoryImage: AppImages.kBasketball,
    ),
    HomeCategoriesModel(
      categoryName: S.of(context).vollyballCategory,
      categoryImage: AppImages.kVollyball,
    ),
    HomeCategoriesModel(
      categoryName: S.of(context).tennisCategory,
      categoryImage: AppImages.kTennis,
    ),
  ];
}
