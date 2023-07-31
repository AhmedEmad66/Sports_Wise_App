import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_wise_app/Components/side_menu_btn.dart';

import '../Data/Cubits/Change_Language_Cubit/change_language_cubit.dart';
import '../Data/Models/language_model.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../Res/app_strings.dart';
import '../generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  S.of(context).themeModeDark,
                  style: const TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 25,
                    color: AppColors.kMyWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {
                    AwesomeDialog(
                      context: context,
                      dialogBackgroundColor: AppColors.kBackGroundColor,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      desc: S.of(context).themeComingSoonMessage,
                      descTextStyle: const TextStyle(
                        color: AppColors.kMyWhite,
                        fontSize: 25,
                        fontFamily: "MyFont",
                      ),
                      btnOkOnPress: () {},
                      btnOkColor: AppColors.kMyDarkGrey,
                      btnOkText: S.of(context).messageOkBtn,
                    ).show();
                  },
                  activeColor: AppColors.kPrimaryColor,
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
    );
  }
}