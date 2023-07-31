import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

import '../../Data/Cubits/Top_Scorers_Cubit/top_scorers_cubit.dart';
import '../../Res/app_colors.dart';
import '../../generated/l10n.dart';

class LeagueTopScorers extends StatelessWidget {
  const LeagueTopScorers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopScorersCubit, TopScorersState>(
      builder: (context, state) {
        if (state is TopScorersLoading) {
          return Shimmer.fromColors(
              baseColor:
                  const Color.fromARGB(255, 247, 247, 247).withOpacity(0.4),
              highlightColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
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
                        for (int i = 0; i < 10; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.kMyLightGrey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ));
        } else if (state is TopScorersSuccess) {
          var ourTopScorers = state.leagueTopScorers.result!;
          return SingleChildScrollView(
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
                    for (int i = 0; i < ourTopScorers.length; i++)
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.kMyDarkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ourTopScorers[i].playerName ?? "",
                                    style: const TextStyle(
                                      color: AppColors.kMyWhite,
                                      fontSize: 20,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).topScorersTeamTitle,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.kMyLightGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          ourTopScorers[i].teamName ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.kMyWhite,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).topScorersNumberTitle,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.kMyLightGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ourTopScorers[i].playerPlace.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMyWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).topScorersGoalsTitle,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.kMyLightGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ourTopScorers[i].goals.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMyWhite,
                                        ),
                                      ),
                                    ],
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
          );
        } else {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kMyDarkGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  S.of(context).topScorersNotExcistMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.kMyWhite,
                    fontFamily: "Ubuntu",
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
