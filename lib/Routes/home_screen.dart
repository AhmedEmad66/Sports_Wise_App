import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Routes/countries_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../Data/Models/home_categories_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // Named Route
  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.kBG),
          ),
        ),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: homeCategoriesItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    index == 0
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CountriesScreen()))
                        : AwesomeDialog(
                            context: context,
                            dialogBackgroundColor: AppColors.kBackGroundColor,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Coming Soon ^_^',
                            titleTextStyle: const TextStyle(
                              color: AppColors.kMyWhite,
                              fontSize: 25,
                              fontFamily: "Ubuntu",
                            ),
                            btnOkOnPress: () {},
                            btnOkColor: AppColors.kMyDarkGrey,
                          ).show();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          homeCategoriesItems[index].categoryImage,
                        ),
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          homeCategoriesItems[index].categoryName,
                        )),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
