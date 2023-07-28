import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../Components/search_bar.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Team's Players",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(
                hintText: "Search here..",
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.kPrimaryColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 500),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          for (int i = 0; i < 20; i++)
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogBackgroundColor:
                                      AppColors.kBackGroundColor,
                                  customHeader: const CircleAvatar(
                                    radius: 55,
                                    backgroundImage: AssetImage(
                                        "assets/images/onboarding/m.png"),
                                  ),
                                  animType: AnimType.rightSlide,
                                  body: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Name: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Number: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Country: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Position: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Age: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Yellow Cards: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Red Cards: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Goals: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Assists: ",
                                        style: TextStyle(
                                          color: AppColors.kMyWhite,
                                          fontSize: 25,
                                          fontFamily: "Ubuntu",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  btnOkOnPress: () {},
                                  btnOkColor: AppColors.kMyDarkGrey,
                                ).show();
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.kMyDarkGrey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: AppColors.kMyWhite,
                                      backgroundImage:
                                          AssetImage(AppImages.kOnboard2),
                                      radius: 25,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Player Name",
                                          style: TextStyle(
                                            color: AppColors.kMyWhite,
                                            fontSize: 15,
                                            fontFamily: "Ubuntu",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Player Position",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.kMyLightGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
