import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../Res/app_colors.dart';

class TeamsAndPlayersScreen extends StatelessWidget {
  const TeamsAndPlayersScreen({super.key});
  // Named Route
  static const String id = "TeamsAndPlayersScreen";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //To Avoid the keyboard size
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Row(
              //   children: const [
              //     BackArrow(),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              const TabBar(
                  dividerColor: Colors.transparent,
                  physics: BouncingScrollPhysics(),
                  labelPadding: EdgeInsets.only(
                    right: 15,
                  ),
                  labelColor: AppColors.kPrimaryColor,
                  unselectedLabelColor: AppColors.kMyLightGrey,
                  labelStyle: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(text: "Teams"),
                    Tab(text: "Players"),
                  ]),
              const SizedBox(
                height: 20,
              ),
              // const SearchBar(
              //   hintText: "Search here..",
              //   width: 322,
              // ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
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
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: AppColors.kMyDarkGrey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
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
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: "player name: ...",
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
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: AppColors.kMyDarkGrey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
