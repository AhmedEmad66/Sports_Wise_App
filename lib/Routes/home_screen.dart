import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_wise_app/Data/Cubits/Change_Language_Cubit/change_language_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Theme_Mode_Cubit/theme_mode_switch_cubit.dart';
import 'package:sport_wise_app/Res/app_colors.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Res/app_strings.dart';
import 'package:sport_wise_app/Routes/countries_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../Components/side_menu_btn.dart';
import '../Data/Models/home_categories_model.dart';
import '../Data/Models/language_model.dart';
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
              Text(
                S.of(context).sideMenuTitle,
                style: const TextStyle(
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
                  Text(
                    S.of(context).themeModeLight,
                    style: const TextStyle(
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
                height: 10,
              ),
              BlocBuilder<ChangeLanguageCubit, ChangeLocaleState>(
                builder: (context, state) {
                  return DropdownButton(
                      // disabledHint: Text(S.of(context).languages),
                      hint: Text(
                        S.of(context).languages,
                        style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 25,
                          color: AppColors.kMyWhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 15,
                        color: AppColors.kBackGroundColor,
                        fontWeight: FontWeight.w700,
                      ),
                      icon: const Icon(
                        Icons.language,
                        color: AppColors.kMyLightGrey,
                      ),
                      underline: const SizedBox(),
                      items: Language.languageList()
                          .map<DropdownMenuItem<Language>>(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    lang.languageFlag,
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                  Text(lang.languageName),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (Language? language) {
                        AppStrings.kAppLanguage = language!.languageCode;
                        context
                            .read<ChangeLanguageCubit>()
                            .changeLanguege(language.languageCode);
                        // Restart.restartApp(webOrigin: SplashScreen.id);
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SideMenuBtn(
                title: S.of(context).support,
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogBackgroundColor: AppColors.kBackGroundColor,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).messageSupportTitle,
                          style: const TextStyle(
                            color: AppColors.kMyLightGrey,
                            fontSize: 25,
                            fontFamily: "MyFont",
                          ),
                        ),
                        Text(
                          S.of(context).messageSupportDes1,
                          style: const TextStyle(
                            color: AppColors.kMyWhite,
                            fontSize: 25,
                            fontFamily: "MyFont",
                          ),
                        ),
                        Text(
                          S.of(context).messageSupportDes2,
                          style: const TextStyle(
                            color: AppColors.kMyWhite,
                            fontSize: 25,
                            fontFamily: "MyFont",
                          ),
                        ),
                        Text(
                          S.of(context).messageSupportDes3,
                          style: const TextStyle(
                            color: AppColors.kMyWhite,
                            fontSize: 25,
                            fontFamily: "MyFont",
                          ),
                        ),
                      ],
                    ),
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.kMyDarkGrey,
                    btnOkText: S.of(context).messageOkBtn,
                  ).show();
                },
              ),
              SideMenuBtn(
                title: S.of(context).developerInfo,
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogBackgroundColor: AppColors.kBackGroundColor,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).messageSupportTitle,
                          style: const TextStyle(
                            color: AppColors.kMyLightGrey,
                            fontSize: 25,
                            fontFamily: "MyFont",
                          ),
                        ),
                        Image.asset(
                          AppImages.kDeveloperInfo,
                        ),
                      ],
                    ),
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.kMyDarkGrey,
                    btnOkText: S.of(context).messageOkBtn,
                  ).show();
                },
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
              Text(
                S.of(context).homeScreenTitle,
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColors.kPrimaryColor,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(
                flex: 2,
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
                      child: Container(
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
