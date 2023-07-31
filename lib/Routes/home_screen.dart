import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Routes/countries_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../Components/custom_drawer.dart';
import '../Components/home_categoey_container.dart';
import '../Data/Models/home_categories_model.dart';
import '../Res/app_styles.dart';
import '../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // Named Route
  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    List<HomeCategoriesModel> categories = homeCategoriesItems(context);
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      extendBodyBehindAppBar: true,
      // AppBar
      appBar: AppBar(
        backgroundColor: AppColors.kMyTransparent,
        shadowColor: AppColors.kMyTransparent,
      ),
      // Home Side Menu
      drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // Background Image
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.kMainBG),
          ),
        ),
        // To avoid system bar
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              // Home Title
              Text(
                S.of(context).homeScreenTitle,
                textAlign: TextAlign.center,
                style: AppStyles.kScreenMainTitle,
              ),
              const Spacer(
                flex: 2,
              ),
              // Category Gridview
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        index == 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountriesScreen()))
                            // Dialog box for categories
                            : AwesomeDialog(
                                context: context,
                                dialogBackgroundColor:
                                    AppColors.kBackGroundColor,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: S.of(context).comingSoonMessage,
                                titleTextStyle: const TextStyle(
                                  color: AppColors.kMyWhite,
                                  fontSize: 25,
                                  fontFamily: "MyFont",
                                ),
                                btnOkOnPress: () {},
                                btnOkColor: AppColors.kMyDarkGrey,
                                btnOkText: S.of(context).messageOkBtn,
                              ).show();
                      },
                      child:
                          // Categories Container
                          HomeScreenCategoryContainer(
                        categories: categories,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
