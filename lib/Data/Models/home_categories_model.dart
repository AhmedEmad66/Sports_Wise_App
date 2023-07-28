import 'package:sport_wise_app/Res/app_images.dart';

class HomeCategoriesModel {
  final String categoryName;
  final String categoryImage;

  HomeCategoriesModel(
      {required this.categoryName, required this.categoryImage});
}

List<HomeCategoriesModel> homeCategoriesItems = [
  HomeCategoriesModel(
    categoryName: "Football",
    categoryImage: AppImages.kFootball,
  ),
  HomeCategoriesModel(
    categoryName: "Basketball",
    categoryImage: AppImages.kBasketball,
  ),
  HomeCategoriesModel(
    categoryName: "Vollyball",
    categoryImage: AppImages.kVollyball,
  ),
  HomeCategoriesModel(
    categoryName: "Tennis",
    categoryImage: AppImages.kTennis,
  ),
];
