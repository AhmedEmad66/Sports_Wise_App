import '../../Res/app_images.dart';

class HomeCategoriesModel {
  final String categoryName;
  final String categoryImage;

  HomeCategoriesModel({required this.categoryName, required this.categoryImage});
}

List<HomeCategoriesModel> homeCategoriesItems = [
    HomeCategoriesModel(
        categoryName: "Football", categoryImage: AppImages.kAppLogo),
    HomeCategoriesModel(
        categoryName: "Basketball", categoryImage: AppImages.kOnboard1),
    HomeCategoriesModel(
        categoryName: "Cricket", categoryImage: AppImages.kAppLogo),
    HomeCategoriesModel(
        categoryName: "Tennis", categoryImage: AppImages.kOnboard1),
  ];