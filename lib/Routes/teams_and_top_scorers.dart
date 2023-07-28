import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sport_wise_app/Routes/players_screen.dart';

import '../Components/search_bar.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class TeamsAndTopScorers extends StatelessWidget {
  const TeamsAndTopScorers({super.key});
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
        body: Container(
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
                    unselectedLabelColor: AppColors.kMyWhite,
                    labelStyle: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: TextStyle(
                      backgroundColor: Color.fromARGB(125, 0, 0, 0),
                      fontFamily: "Ubuntu",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(text: "Teams"),
                      Tab(text: "TopScorers"),
                    ]),
                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SearchBar(
                              hintText: "Search here..",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: AnimationLimiter(
                              child: GridView.count(
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 2,
                                children: List.generate(
                                  10,
                                  (int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 10,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PlayerScreen()));
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: AppColors.kMyDarkGrey,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Stack(
                                                children: const [
                                                  Text(
                                                    "Name",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "Ubuntu",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.kMyWhite,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
