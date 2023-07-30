import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sport_wise_app/Data/Cubits/Change_Language_Cubit/change_language_cubit.dart';
import 'package:sport_wise_app/Res/app_images.dart';
import 'package:sport_wise_app/Res/app_strings.dart';

import '../Routes/splash_screen.dart';

class ArabicLanguage extends StatelessWidget {
  const ArabicLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // To Change the language to Arabic
          BlocBuilder<ChangeLanguageCubit, ChangeLocaleState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  AppStrings.kAppLanguage = "ar";
                  context.read<ChangeLanguageCubit>().changeLanguege("ar");
                  // Restart.restartApp(webOrigin: SplashScreen.id);
                },
                child: Row(
                  children: [
                    const Text(
                      "العربية",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    // Arabic Flag
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(AppImages.kArabicFlag),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EnglishLanguage extends StatelessWidget {
  const EnglishLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // To Change the language to English
          BlocBuilder<ChangeLanguageCubit, ChangeLocaleState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  AppStrings.kAppLanguage = "en";
                  context.read<ChangeLanguageCubit>().changeLanguege("en");
                  // Restart.restartApp(webOrigin: SplashScreen.id);
                },
                child: Row(
                  children: [
                    // English Flag
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(AppImages.kEnglishFlag),
                    ),
                    const Text(
                      "Eng",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
