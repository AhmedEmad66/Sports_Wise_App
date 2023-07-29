import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_wise_app/Data/Cubits/Theme_Mode_Cubit/theme_mode_switch_cubit.dart';
import 'package:sport_wise_app/Res/app_colors.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Routes/countries_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../Components/side_menu_btn.dart';
import '../Data/Models/home_categories_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // Named Route
  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.kMyTransparent,
        shadowColor: AppColors.kMyTransparent,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.kMyDarkGrey,
        width: MediaQuery.of(context).size.width * 2 / 2.7,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                "Side Menu",
                style: TextStyle(
                  fontFamily: "MyFont",
                  fontSize: 35,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Light Mode",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 25,
                      color: AppColors.kMyWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<ThemeModeSwitchCubit, bool>(
                    builder: (context, state) {
                      return Switch(
                        value: state,
                        onChanged: (value) {
                          context.read<ThemeModeSwitchCubit>().isSwitched();
                        },
                        activeColor: AppColors.kPrimaryColor,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SideMenuBtn(
                title: "Langauges",
                onTap: () {},
              ),
              SideMenuBtn(
                title: "Support",
                onTap: () {},
              ),
              SideMenuBtn(
                title: "Developer Info",
                onTap: () {},
              ),
              const Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.kMainBG),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              const Text(
                "There are many interisting sports to choose XD",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.kMyWhite,
                  fontFamily: "MyFont",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
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
                  itemCount: homeCategoriesItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        index == 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountriesScreen()))
                            : AwesomeDialog(
                                context: context,
                                dialogBackgroundColor:
                                    AppColors.kBackGroundColor,
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
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              homeCategoriesItems[index].categoryImage,
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
                            homeCategoriesItems[index].categoryName,
                            style: const TextStyle(
                              fontFamily: "Ubuntu",
                              color: AppColors.kMyWhite,
                              fontSize: 20,
                            ),
                          ),
                        ),
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
